package user

type User struct {
	Id            int64  `json:"id"`
	Name          string `json:"name"`
	Password 			string `json:"password"`
	Type 					string `json:"type"`
	Desc 					string `json:"desc"`
}

type Users struct {
	Data []User `json:"data"`
}
