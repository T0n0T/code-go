package global

type Config struct {
	Command
	Setting
}

type Command struct {
	Check   Check   `toml:"check" mapstructure:"check"`
	Connect Connect `toml:"connect" mapstructure:"connect"`
	Control Control `toml:"control" mapstructure:"control"`
}

type Check struct {
	CheckWlan string `toml:"wlan" mapstructure:"wlan"`
	CheckUart string `toml:"uart" mapstructure:"uart"`
}

type Connect struct {
	Reset   string   `toml:"reset" mapstructure:"reset"`
	Link    string   `toml:"link" mapstructure:"link"`
	UnLink  string   `toml:"unlink" mapstructure:"unlink"`
	ShowMsg string   `toml:"show-msg" mapstructure:"show-msg"`
	Config  []string `toml:"setting" mapstructure:"setting"`
}

type Control struct {
	LinkSocket   string `toml:"link-socket" mapstructure:"link-socket"`
	UnLinkSocket string `toml:"unlink-socket" mapstructure:"unlink-socket"`
	Send         string `toml:"send" mapstructure:"send"`
	Recv         string `toml:"recv" mapstructure:"recv"`
	Msg          string `toml:"msg" mapstructure:"msg"`
}
type Setting struct {
	WLAN string `toml:"wlan-name" mapstructure:"wlan-name"`
	CA   CA     `toml:"ca" mapstructure:"ca"`
	UART UART   `toml:"uart" mapstructure:"uart"`
}

type CA struct {
	ASPath  string `toml:"AS-path" mapstructure:"AS-path"`
	STAPath string `toml:"STA-path" mapstructure:"STA-path"`
}

type UART struct {
	Name     string `toml:"name" mapstructure:"name"`
	Baud     int    `toml:"baud" mapstructure:"baud"`
	DataBits int    `toml:"databit" mapstructure:"databit"`
	Parity   int    `toml:"parity" mapstructure:"parity"`
	StopBits int    `toml:"stopbit" mapstructure:"stopbit"`
}
