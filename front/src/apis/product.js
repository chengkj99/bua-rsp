import axios from 'axios'

// 查询产品列表
export function getProductList(query) {
  return axios.get(`/api/product/list`, { params: { query } })
}

// 根据产品ID查询产品
export function getProductListById(id) {
  return axios.get(`/api/product/list${id}`)
}

// 添加产品
export function addProduct(value) {
  return axios.post(`/api/product/add`, {
    publisher_id: value.uid,
    name: value.name,
    original_price: value.originalPrice,
    firm_model: value.firmModel,
    parameter: value.parameter,
    functional_use: value.functionalUse,
    desc: value.desc,
    contacts: value.contacts,
    phone: value.phone,
    mail: value.mail,
    img_url: value.imgUrl,
    owner: value.owner,
    status: value.status || 'enable',
    price_value: value.priceValue,
    price_type: value.priceType
  })
}

// 更改产品状态
export function updateProductStatus(id, status) {
  return axios.post(`/api/product/status/${id}`, { status })
}
// 更改产品信息
export function updateProduct(value) {
  return axios.put(`/api/product/${value.id}`, {
    publisher_id: value.uid,
    name: value.name,
    original_price: value.originalPrice,
    firm_model: value.firmModel,
    parameter: value.parameter,
    functional_use: value.functionalUse,
    desc: value.desc,
    contacts: value.contacts,
    phone: value.phone,
    mail: value.mail,
    img_url: value.imgUrl,
    owner: value.owner,
    status: value.status || 'enable',
    price_value: value.priceValue,
    price_type: value.priceType
  })
}

// 删除产品
export function deleteProduct(id) {
  return axios.delete(`/api/product/${id}`)
}
