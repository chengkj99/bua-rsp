package booking

type Booking struct {
	Id          int64  `json:"id"`
	ProductId   int64  `json:"product_id"`
	Uid         int64  `json:"uid"`
	PublisherId int64  `json:"publisher_id"` // 产品拥有者 ID
	BookingName string `json:"booking_name"` // 预约人姓名
	StartTime   string `json:"start_time"`   // 2018-6-27
	EndTime     string `json:"end_time"`     // 2018-6-28
	Reason      string `json:"reason"`       // 申请理由
	Reply       string `json:"reply"`        // 审核回复
	Status      string `json:"status"`       // 审核人员操作状态
}

type Bookings struct {
	Data []Booking `json:"data"`
}
