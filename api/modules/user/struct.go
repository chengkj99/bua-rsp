package user

type User struct {
	Id       int64  `json:"id"`
	Name     string `json:"name"`
	Password string `json:"password"`
	Phone    string `json:"phone"`
	Mail     string `json:"mail"`
	Cname    string `json:"cname"`
	Type     string `json:"type"`
}

type Users struct {
	Data []User `json:"data"`
}
