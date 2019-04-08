package price

// Price 价格结构体
type Price struct {
	Id    int64  `json:"id"`
	Type  string `json:"type"`  // 费用类型：按天 byDay，按小时 byHour，按次 byTimes，自定义 ohter
	Value string `json:"value"` // 价格
}
