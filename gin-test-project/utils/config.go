package utils

import (
	"bufio"
	"encoding/json"
	"os"
)

type Config struct {
	Name     string `json:"name"`
	Mode     string `json:"mode"`
	Host     string `json:"host"`
	Port     string `json:"port"`
	Dbuser   string `json:"dbuser"`
	Dbpasswd string `json:"dbpasswd"`
	Dbhost   string `json:"dbhost"`
	Dbport   string `json:"dbport"`
	Dbname   string `json:"dbname"`
}

var cfg *Config = nil

func ConfigParse(path string) (*Config, error) {
	file, err := os.Open(path)
	if err != nil {
		panic(err)
	}
	defer file.Close()

	reader := bufio.NewReader(file)
	if err := json.NewDecoder(reader).Decode(&cfg); err != nil {
		return nil, err
	}
	return cfg, nil
}
