package booking

type Booking struct {
	Id         int64  `json:"id"`
	ProductId  int64  `json:"product_id"`
	BookingMan string `json:"booking_man"`
	StartTime  string `json:"start_time"` // 2018-6-27 10:20:56
	EndTime    string `json:"end_time"`   // 2018-6-28 10:20:56
}

type Bookings struct {
	Data []Booking `json:"data"`
}
