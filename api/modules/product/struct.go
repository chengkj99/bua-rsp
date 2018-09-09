package product

type Product struct {
	Id            int64  `json:"id"`
	Name          string `json:"name"`
	OriginalPrice string `json:"original_price"`
	FirmModel     string `json:"firm_model"`
	Parameter     string `json:"parameter"`
	FunctionalUse string `json:"functional_use"`
	Desc          string `json:"desc"`
	Contacts      string `json:"contacts"`
	Phone         string `json:"phone"`
	Mail          string `json:"mail"`
	ImgUrl        string `json:"img_url"`
	Owner         string `json:"owner"`
	Status        string `json:"status"` // enable, disable
}
type Products struct {
	Data []Product `json:"data"`
}
