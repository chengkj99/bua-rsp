import axios from 'axios'

export function getUserProduct(uid) {
  return axios.get(`/api/product/list/user/${uid}`)
}
