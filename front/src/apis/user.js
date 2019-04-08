import axios from 'axios'

export function getUser(value) {
  return axios.get('/api/overview')
}

// 用户是没有发布的产品的
// export function getUserProduct(uid) {
//   return axios.get(`/api/product/list/user/${uid}`)
// }

export function loginUser(value) {
  return axios.post('/api/user/login', {
    name: value.name,
    password: value.password
  })
}

// 我的发布的产品
export function getPublisherProduct(uid) {
  return axios.get(`/api/product/list/publisher/${uid}`)
}

export function loginPublisher(value) {
  return axios.post('/api/publisher/login', {
    name: value.name,
    password: value.password
  })
}

// export function getPublisher(value) {
//   return axios.get('/api/publisher/overview')
// }

// 注册
export function registerUser(value) {
  return axios.post('/api/user/add', {
    name: value.name,
    password: value.password,
    type: 'user'
  })
}
