import axios from 'axios'

export function getPayUrl(productId, bookingId, totalAmount, productName) {
  return axios.get('/pay/alipay', {
    params: {
      productId,
      bookingId,
      totalAmount,
      productName
    }
  })
}
