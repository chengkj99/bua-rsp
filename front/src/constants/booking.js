export const bookingStatuses = {
  notDo: 'notDo',
  reject: 'reject',
  agree: 'agree',
  unpaid: 'unpaid',
  paid: 'paid'
}
export const bookingStatusMap = {
  [bookingStatuses.notDo]: '未审核',
  [bookingStatuses.reject]: '未通过',
  [bookingStatuses.agree]: '已同意',
  [bookingStatuses.unpaid]: '未支付',
  [bookingStatuses.paid]: '已付款'
}

export const bookingStatusMapForAudit = {
  [bookingStatuses.notDo]: '未审核',
  [bookingStatuses.reject]: '已拒绝',
  [bookingStatuses.agree]: '已通过',
  [bookingStatuses.unpaid]: '未支付',
  [bookingStatuses.paid]: '已付款'
}

export const bookingStatusStyle = {
  [bookingStatuses.notDo]: 'info',
  [bookingStatuses.reject]: 'danger',
  [bookingStatuses.agree]: 'success',
  [bookingStatuses.unpaid]: 'warning',
  [bookingStatuses.paid]: 'success'
}
