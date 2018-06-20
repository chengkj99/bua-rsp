package booking

type Booking struct {
	Id         int64  `json:"id"`
	ProductId  int64  `json:"product_id"`
	BookingMan string `json:"booking_man"`
	StartTime  int    `json:"start_time"`
	EndTime    int    `json:"end_time"`
}

type Bookings struct {
	Data []Booking `json:"data"`
}
