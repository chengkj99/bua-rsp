export const statuses = {
  enable: 'enable',
  disable: 'disable'
}

export const statusNameMap = {
  [statuses.enable]: '运行正常',
  [statuses.disable]: '不可用'
}

export const statusesStyle = {
  [statuses.enable]: 'success',
  [statuses.disable]: 'info'
}

export const bookingStatuses = {
  agree: true,
  notAgree: false
}

export const bookingStatusNameMap = {
  [bookingStatuses.agree]: '已同意',
  [bookingStatuses.notAgree]: '未同意'
}

export const bookingStatusStyle = {
  [bookingStatuses.agree]: 'success',
  [bookingStatuses.notAgree]: 'info'
}

export const priceTypes = {
  byDay: 'day',
  byHour: 'hour',
  byTimes: 'times'
}
export const priceTypeNameMap = {
  [priceTypes.byDay]: '天',
  [priceTypes.byHour]: '时',
  [priceTypes.byTimes]: '次'
}

export const priceStyle = {
  [priceTypes.byDay]: 'warning',
  [priceTypes.byHour]: 'danger',
  [priceTypes.byTimes]: 'success'
}

// export const imgDomainName = "http://phvpk2lt7.bkt.clouddn.com"
export const imgDomainName =
  'http://ckj-bucket.oss-cn-beijing.aliyuncs.com/bua-rsp'
