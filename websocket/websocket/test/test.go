package test

import (
	"encoding/json"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/gorilla/websocket"
)

// 连接成功结构体
type connectedDataS struct {
	Event            string `json:"_event"`
	HistoryClientNum int    `json:"historyClientNum"`
	OnlineClientNum  int    `json:"onlineClientNum"`
}

// 消息结构体
type messageDataS struct {
	Event   string `json:"_event"`
	Message string `json:"message"`
}

// 存储数据
var (
	historyClientNum = 0
)

// 广播消息
func broadcastMsg(hub *Hub, mt int, message []byte) {
	for client := range hub.clients {
		client.conn.WriteMessage(mt, message)
	}
}

// 客户端实例
type Client struct {
	hub  *Hub
	conn *websocket.Conn
	send chan []byte
}

// 读取数据通道
func (c *Client) readPump() {
	defer func() {
		c.hub.unregister <- c
		c.conn.Close()
	}()
	for {
		_, message, err := c.conn.ReadMessage()
		if err == nil {
			c.hub.broadcast <- message
		} else {
			break
		}
	}
}

// 发送数据通道
func (c *Client) writePump() {
	defer func() {
		c.conn.Close()
	}()
	for message := range c.send {
		var data = messageDataS{
			Event:   "message",
			Message: string(message),
		}
		dataJson, _ := json.Marshal(data)
		c.conn.WriteMessage(websocket.TextMessage, dataJson)
	}
}

// ws hub
type Hub struct {
	clients    map[*Client]bool
	broadcast  chan []byte
	register   chan *Client
	unregister chan *Client
}

// 运行hub
func (h *Hub) run() {
	for {
		select {
		case client := <-h.register:
			h.clients[client] = true
			// 更新历史客户端数
			historyClientNum++
			// 广播进入
			var data = connectedDataS{
				Event:            "connected",
				HistoryClientNum: historyClientNum,
				OnlineClientNum:  len(h.clients),
			}
			var dataJson, _ = json.Marshal(data)
			broadcastMsg(h, websocket.TextMessage, dataJson)
		case client := <-h.unregister:
			if _, ok := h.clients[client]; ok {
				delete(h.clients, client)
				close(client.send)
				// 广播离开
				var data = connectedDataS{
					Event:            "connected",
					HistoryClientNum: historyClientNum,
					OnlineClientNum:  len(h.clients),
				}
				var dataJson, _ = json.Marshal(data)
				broadcastMsg(h, websocket.TextMessage, dataJson)
			}
		case message := <-h.broadcast:
			for client := range h.clients {
				select {
				case client.send <- message:
				default:
					close(client.send)
					delete(h.clients, client)
				}
			}
		}
	}
}

// 链接实例
func newHub() *Hub {
	return &Hub{
		broadcast:  make(chan []byte),
		register:   make(chan *Client),
		unregister: make(chan *Client),
		clients:    make(map[*Client]bool),
	}
}

// ws upGrader
var upGrader = websocket.Upgrader{
	CheckOrigin: func(r *http.Request) bool {
		return true
	},
}

func createWs(c *gin.Context, hub *Hub) {
	conn, err := upGrader.Upgrade(c.Writer, c.Request, nil)
	if err != nil {
		log.Println(err)
		return
	}
	client := &Client{hub: hub, conn: conn, send: make(chan []byte, 256)}
	go client.writePump()
	go client.readPump()
	client.hub.register <- client
}

func main() {
	hub := newHub()

	go hub.run()
	router := gin.Default()
	router.LoadHTMLFiles("index.html")
	router.GET("/", func(c *gin.Context) {
		c.HTML(http.StatusOK, "index.html", nil)
	})
	router.GET("/ws", func(ctx *gin.Context) {
		createWs(ctx, hub)
	})
	router.Run(":8080")
}
