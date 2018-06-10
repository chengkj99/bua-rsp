package product

type Product struct {
	Id            int    `json:"id"`
	Name          string `json:"name"`
	OriginalPrice string `json:"original_price"`
	FirmModel     string `json:"firm_model"`
	Parameter     string `json:"parameter"`
	FunctionalUse string `json:"functional_use"`
	Desc          string `json:"desc"`
	Contacts      string `json:"contacts"`
	Phone         string `json:"phone"`
	Mail          string `json:"mail"`
	ImgUrl        string `json:"imgUrl"`
}
type Products struct {
	Data []Product `json:"data"`
}

type Response struct {
	Data    interface{} `json:"data"`
	Code    int         `json:"code"`
	Message string      `json:"message"`
}
