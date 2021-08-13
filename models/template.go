package models

type Template struct {
	ErrNo int64 `json:"errno"`
	Data interface{} `json:"data"`
	ErrMsg string `json:"errmsg"`
}