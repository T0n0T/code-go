package model

import "time"

type LedMsg struct {
	Time   time.Time `json:"time"`
	Status bool      `json:"status"`
	Action string    `json:"action"`
}
