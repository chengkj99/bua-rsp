import axios from 'axios'

// 查询用户预订列表
export function getUserBookingList(id) {
  return axios.get(`/api/booking/list/user/${id}`)
}

// 查询发布者审核列表
export function getPublisherBookingList(uid) {
  return axios.get(`/api/booking/list/publisher/${uid}`)
}

// 添加预订
export function addBooking(value) {
  return axios.post('/api/booking/add', {
    uid: value.uid,
    product_id: value.productId,
    publisher_id: value.publisherId,
    booking_name: value.username,
    start_time: value.startTime,
    end_time: value.endTime,
    reason: value.reason,
    status: 'notDo',
    product_name: value.productName,
    total_price: value.totalPrice
  })
}

// 审核预约 & 更新预订信息
export function updateBooing(value) {
  const { id, ...others } = value
  return axios.put(`/api/booking/${id}`, others)
}

// 查询已被订阅的产品时间
export function getProductUsedTimes(id) {
  return axios.get(`/api/booking/list/product/${id}`)
}
