import axios from 'axios'

// 查询用户预订列表
export function getUserBookingList(uid) {
  return axios.get(`/api/booking/list/user/${uid}`)
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
    status: 'notDo'
  })
}

// 审核预约 & 更新预订信息
export function updateBooing(value) {
  const { id, ...others } = value
  return axios.put(`/api/booking/${id}`, others)
}
