package global

type Config struct {
	Command
	Setting
}

type Command struct {
	CheckWlan  string `yaml:"check-wlan"`
	CheckUart  string `yaml:"check-uart"`
	Connect    string `yaml:"cnnect"`
	DisConnect string `yaml:"disconnect"`
	Send       string `yaml:"send"`
	Recv       string `yaml:"recv"`
	ShowMsg    string `yaml:"show-msg"`
}

type Setting struct {
	WlanName string `yaml:"wlan-name"`
	ASPath   string `yaml:"AS-path"`
	STAPath  string `yaml:"STA-path"`
	UartName string `yaml:"uart-name"`
	Baud     int    `yaml:"baud"`
	DataBits int    `yaml:"databit"`
	Parity   int    `yaml:"parity"`
	StopBits int    `yaml:"stopbit"`
}
