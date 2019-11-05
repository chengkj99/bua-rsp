import axios from 'axios'

export function getPayUrl(productId, bookingId) {
  return axios.get('/pay/alipay', {
    params: {
      productId,
      bookingId
    }
  })
}
