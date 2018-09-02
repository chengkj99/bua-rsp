import axios from 'axios'

// 查询预订列表
export function getBookingList() {
  return axios.get('/api/booking/list')
}

// 添加预订
export function addBooking(value) {
  return axios.post('/api/booking/add', {
    booking_man: value.bookingMan,
    product_id: value.productId,
    start_time: value.startTime,
    end_time: value.endTime
  })
}

// 更改产品预约
export function updateBooing(id, value) {
  return axios.post(`/api/booking/${id}`, {
    booking_man: value.bookingMan,
    product_id: value.productId,
    start_time: value.startTime,
    end_time: value.endTime
  })
}
