package publisher

type Publisher struct {
	Id       int64  `json:"id"`
	Name     string `json:"name"`
	Mail     string `json:"mail"`
	Phone    string `json:"phone"`
	Password string `json:"password"`
	Cname    string `json:"cname"`
	Type     string `json:"type"`
}

type Publishers struct {
	Data []Publisher `json:"data"`
}
