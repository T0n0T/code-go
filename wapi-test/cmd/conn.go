/*
Copyright © 2023 NAME HERE <EMAIL ADDRESS>
*/
package cmd

import (
	"fmt"
	"log"
	"net"
	"os"
	"strings"
	"time"

	"github.com/spf13/cobra"
)

var (
	number    *int
	duration  *string
	chat_flag *bool
	randstr   = `EEvTSV1$wA~w4u#LZ^zBXheL9G30%9#rVbD2isrusNBPQ^(YnFjSvs6fbWKKyvvLuqz^EKw&1zdqj1_LdH4Nyldzg7hWENtUu@R@A@^E@wRyFQoStkLrM~+7YE!~*a%sS7Pt#ujJ~PZUKYp8@olnHK*f^rYuWp_ku#O#aBjgSgN*xtnNWVh)T~6qvEPg9!h3J1z0jKG2$_WEO)1mAHc~tLO$ufj8OIU7Q*J5asbfLE60o3x!fGlO@Dt$Kg(uAYEITviQYqK@h$Pt(Q@bb!%z(DlyH+EDgUiUqI&6r6+)n3$%GxwydH)!qyPB2xczr!pYi$4LQjp0aq)BFS@#!1qGCHoE$lyjbs9M@~rLpWfr$9cR~VGW^*^kOfO^RuJBsJn1~^BjOho#tH8QWHt&$GjMPj~qLCNg6hhQbbU35Id3EOPdG^)$zyE734NDP#cgrV$TJ%*LZEpF%A3~^cI6DWbTl8ow&s3b6wtnbMg3^KPx#rcsJgAi$~U%qQB@tL^rw9*MgJo7m9r$uvS)UgtXJZSP
3S#n07)7Y@($OJU4XR6$@@p6Ms6fsGb$qIh@P#prO#l1C923+9FBGc^P^qkfy*!6GYLL(o2X+q1l^D5_KG!#nhI4rWh_bfScRgcaEZLsZ+6#sWjvS25_&T5zN~g19TgSaHpg(Vm96He+EyV!*U%U##d%$WwGk7UF_+mb5k)w&qWMRO^pUl7SOqyQ6zQBD@cwD2)3eKH5wpo*0mA@UXe9r1$k$&rgJL+NDiendo%hgjM%YH4aW&xtGhzYapD%apmKuh)4b$ZE&hxgd_d2QMY^gvi3%syBdJO+W8X_)6o32!si0M#p@Hv4Gk~5B3(REJYtktto1rbg@1zd47puaSUPBKyOU3Nx2Qdq(ZS3Ei~I(Mmf__aEhv#3#ghxv@7TwzVL8#SfBf07G$JMpW*j&LzDnc4qgs%a6TcRkHNe8uMHySHHfVEmk4wC7!ZgH+C&%FzR$4DLLvOKY(6Hu40m65b4TH6)12!zGq+Vl&+$)HypF_s3S9B)166RtTTrBn^MMoaAYpWV_z6aK$l6zW%)vGuv#KJcKm)UKU6e(J~wbr6pjmrXEDE(CVkMTgXcutW%cvofuT&e&FVMeUiX@Oz*q*aFh$ayu9qugE&iN9)Ym)96YjvnwUdmIZL@2sZa(C@hcKHv@aD^fes
nLs7La$H!@O0h#Bfu#nXBy@*Ir0%(GRzCoGWJZfA3e#roA^ZP1v$TvoJ!x7JiUP^DJkt#lMh^E^y)ilb!YcgmaQ*&*tpGKt)GQ(uYja&li%%LR_Qye%^FGWDUeNYGuQEpPL0u1VC9KVcx_VpAoqd!@7iO8$NRxkyxlsx_^CX!r@~csZFrV91y+V9(JLSxBQt_9$dMe(*RknXIuVvTx%zy1xq1e3dLG&Z@13L1PCKCQoYcsxu7E8FZIE3ll%flWp1UG++6ofD&MpkzJulJ0)BcxUVb8OEN9#!@w*K*m3vNOntB%G$2TJZm6wMlny#Yl7Xm(aLKm0jf4kQvr#9jA)~%$(6VoirZ)t#2_$D&SR^W1h%@hefvP1u8Rq9a@4L@G~HyzOnm37&a~y2L9xQXcqXyufUE498396&MVmPx(ZB_UR20Jq2kZ#3*~S&&S3nekTP77AsVlA4W0C!zPdLza2eZvzA4RXaWKdNYLchLEOsmbRxZDRqAY#H3_01Uhiiv1DLmtS93@)LGHCDWLLiKtNRbG)MDxY9BZ0w&%JXhMxizbLZpGV^3rm!FRtvaWN9G^iMIGtifmWCIOB
2s&+ZHJxJq&aY4f8LTAl)2dV5kpP49QgUyZ31MHAnHYRU!^IEwL3nMTO$1%@RqCm9_LAFVqs+2U!Ts2!nwZaQUo!Zh#87vd!STzHfBkm$Rm6IQKNs9C%cBwAAIyuh14CBGfyX3cx68TT4ac3C@a6B~xtE20bVwQ_q)Ctd3R8!fQLY$20yTGEWx+ND(qp$YBfU_6j_pdTuoepQs@PqAGsicNrdXC8xF^OaGVX8qA@!j8&RfFfOSi0qJluzeaMvv!GUU%p9N8(GH64ZHI95IldCWd^%qBaa~ApNHv_NppXc9jHm3csCSN2y(2K@OHY+2r1)dTb8QVx4qEynl0HZ71wdrIFXITB(G@82oUZD#CwbMB&oyyR0U1fhSHFp%uVZU7Bi^S7KMfD7)g0KV*54ho)HG$y~Ys4*Tu9LDXex2f18)$Uvip@hULJHsti~F6vKLsE+e5%XUYpn&^7hb5__58I%%DfNYii3oxOy4j~G#(HO08$3%*6t_ozw3hK9LKbtD(0sVrKyP~Zx@3$_6JBq*j3lYm&oa
ivBsf9Y#X~EHGa3!Nm(ms~Us&K9$Yu5@Q0OiVNi9S+lcZwGw1E2NwP$PeI3m$1Hwah9UyOYAN5^vJd8M7CpU72~5Md)+(sP_mZHU)BJTV%9JZ85*f%YOsMDwGFqj%NzJJbevwqqn&r0Gb#@ENifaVoeC$TbuSIp089)Z(~gm_rX5PxPk^cV5fnjIX^N+8M0ez$SV)uU@)nOSJatm4M@A~XAqJtA2Jwgk39v1J!#~%*T!$l1EWy&N3YT(g61%pazDX!)B$21I9($xwD*GQyepiB28Hf2RBwzNlJXtn&2F$swXdUj0bUq*%SW2K!ElRWC^FM(6l3_WeJuJe1lBq!zSSadE0*qo^w+fFeN_y*Tn+4cH1yPW+_BSLn50@W@ZeX_o&mX5cas1ZnE5rN)H2L8B+o#Bd4R!7t6oPD)M6fy*9%LtC)tm4o@K4fmPFNkM7Q2Kva51u1XQm$WhS#xdXXq*kPSdx(DnGw&+2Bd_~8~uOwC7K_L&2Q^Nm_1qILxpDqajTFws3Q5S
`
)

// connCmd represents the conn command
var connCmd = &cobra.Command{
	Use:   "conn",
	Short: "使用来自config.yaml的AT命令进行连接测试",

	Run: func(cmd *cobra.Command, args []string) {
		var (
			tmp                      = ""
			success_time             = 0
			success_duration float64 = 0
		)
		fmt.Println(*number, *duration, *chat_flag)
		dead, err := time.ParseDuration(*duration)
		cobra.CheckErr(err)

		if *chat_flag {
			go TCPUP()
		}

		sendch <- C.Command.Connect.Reset
	LoopReset:
		for {
			select {
			case tmp = <-recvch:
				fmt.Fprintf(os.Stdout, "%s", tmp)
			case <-time.After(2 * time.Second):
				fmt.Fprintf(os.Stderr, "wapi模块配置复位完成\r\n")
				break LoopReset
			}
		}

		fmt.Fprintf(os.Stdout, "配置wapi连接\n")
		st := time.Now()
		for _, cmd := range C.Command.Connect.Config {
			tmp = ""
			select {
			case sendch <- cmd:
				tmp = <-recvch
			case <-time.After(dead):
				fmt.Fprintf(os.Stderr, "wapi模块连接配置超时: %s\n", cmd)
			}
			fmt.Fprintf(os.Stdout, "%s", tmp)
			if !strings.Contains(tmp, "OK") {
				fmt.Fprintf(os.Stderr, "wapi模块连接配置失败: cmd: %s msg: %s", cmd, tmp)
				os.Exit(1)
			}
		}

		fmt.Fprintf(os.Stdout, "wapi连接配置结束,使用了 %v 秒\n", time.Since(st).Seconds())
		time.Sleep(1 * time.Second)
		for i := 0; i < *number; i++ {
			tmp = ""
			t := time.Now()
			select {
			case sendch <- C.Command.Connect.Link:
			case <-time.After(dead):
				fmt.Fprintf(os.Stderr, "wapi模块超时: %s\n", C.Command.Connect.Link)
				continue
			}

		Loop:
			for {
				select {
				case tmp = <-recvch:
					fmt.Fprintf(os.Stdout, "%s", tmp)
					if strings.Contains(tmp, C.WLAN) {
						cost := time.Since(t)
						success_time++
						success_duration += cost.Seconds()
						fmt.Fprintf(os.Stdout, "第 %d 次成功连接\n", success_time)
						break Loop
					}
				case <-time.After(dead):
					break Loop
				}
			}
			if *chat_flag {
				Chat(dead)
			}
			sendch <- C.Command.Connect.UnLink
			oncerecv(3 * time.Second)
			fmt.Fprintf(os.Stdout, "断开第%d次测试连接\n", i+1)
			fmt.Fprintf(os.Stdout, "-----------------------------------------------------------------------------\n")
			time.Sleep(2 * time.Second)
		}
		if success_time != 0 && *number != 0 {
			fmt.Fprintf(os.Stdout, `=============================================================================
测试次数	|	连接成功率%%	|	成功连接平均耗时/s
%d		|	%v		|	%v\n
=============================================================================`,
				*number, float64(success_time)/float64(*number)*100, success_duration/float64(success_time))
		} else {
			fmt.Fprintln(os.Stderr, "没有成功的连接")
		}

	},
}

func init() {
	rootCmd.AddCommand(connCmd)
	number = connCmd.Flags().IntP("number", "n", 5, "测试的次数")
	duration = connCmd.Flags().StringP("duration", "d", "5s", "单次测试最大时间")
	chat_flag = connCmd.Flags().BoolP("chat", "c", false, "启用socket通信测试")
}

func Chat(d time.Duration) {
	fmt.Fprintf(os.Stdout, "测试socket通信\n")
	var (
		tmp        string
		socket_num int = 1
	)
	sendch <- C.Control.LinkSocket
	if tmp = oncerecv(2 * time.Second); !strings.Contains(tmp, "OK") {
		fmt.Fprintf(os.Stderr, "socket获取失败\n")
		sendch <- fmt.Sprintf("%s%d", C.Control.UnLinkSocket, socket_num)
		recv(d)
		return
	}
	sendch <- fmt.Sprintf("%s%d,%d", C.Control.Send, socket_num, len(C.Control.Msg))
	if strings.Contains(oncerecv(1*time.Second), "OK") {
		sendch <- C.Control.Msg
		sendch <- fmt.Sprintf("%s%d,%d", C.Control.Recv, socket_num, len(C.Control.Msg))
		if tmp = recv(2 * time.Second); strings.Contains(tmp, "OK") {
			fmt.Fprintf(os.Stdout, "%s\n", tmp)
		} else {
			fmt.Fprintf(os.Stderr, "socket接收失败\n")
			sendch <- fmt.Sprintf("%s%d", C.Control.UnLinkSocket, socket_num)
			recv(d)
			return
		}
	} else {
		fmt.Fprintf(os.Stderr, "socket发送启动失败\n")
		return
	}
	fmt.Fprintf(os.Stdout, "结束socket通信测试\n")
}

func recv(d time.Duration) string {
	var str = ""
Loop:
	for {
		select {
		case tmp := <-recvch:
			str += tmp
			fmt.Fprintf(os.Stdout, "%s", tmp)
		case <-time.After(d):
			fmt.Fprintf(os.Stderr, "接受字符串超时\r\n")
			break Loop
		}
	}
	return str
}

func oncerecv(d time.Duration) string {
Loop:
	for {
		select {
		case tmp := <-recvch:
			return tmp
		case <-time.After(d):
			fmt.Fprintf(os.Stderr, "接受字符串超时\r\n")
			break Loop
		}
	}
	return ""
}

func TCPUP() {
	// 启动服务器
	listener, err := net.Listen("tcp", ":1234")
	if err != nil {
		log.Println("Failed to start server:", err)
		return
	}

	for {
		// 循环接受客户端连接
		conn, err := listener.Accept()
		if err != nil {
			log.Println("Failed to accept connection:", err)
			return
		}

		go handleConnection(conn) // 启动一个 goroutine 处理连接
	}
}

// 处理连接
func handleConnection(conn net.Conn) {
	defer conn.Close()

	// 读取客户端发送的数据
	buffer := make([]byte, 1024)
	n, err := conn.Read(buffer)
	if err != nil {
		log.Println("Failed to read data:", err)
		return
	}

	// 回传收到的数据给客户端
	_, err = conn.Write(buffer[:n])
	if err != nil {
		log.Println("Failed to write data:", err)
		return
	}
}
