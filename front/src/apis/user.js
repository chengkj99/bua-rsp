import axios from 'axios'

export function getUserProduct(uid) {
  return axios.get(`/api/product/list/user/${uid}`)
}

export function login(value) {
  return axios.post('/api/user/login', { name: value.name, password: value.password })
}

export function getUser(value) {
  return axios.get('/api/user/overview')
}
