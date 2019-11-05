package booking

type Booking struct {
	Id          int64  `json:"id"`
	ProductId   int64  `json:"product_id"`
	ProductName string `json:"product_name"`
	Uid         int64  `json:"uid"`
	PublisherId int64  `json:"publisher_id"` // 产品拥有者 ID
	BookingName string `json:"booking_name"` // 预约人姓名
	StartTime   int64  `json:"start_time"`   // 开始时间时间戳
	EndTime     int64  `json:"end_time"`     // 结束时间时间戳
	Reason      string `json:"reason"`       // 申请理由
	Reply       string `json:"reply"`        // 审核回复
	Status      string `json:"status"`       // 审核人员操作状态 notDo,agree,reject,unpaid,paid
}

type Bookings struct {
	Data []Booking `json:"data"`
}
