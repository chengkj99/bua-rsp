import { observable, action, computed } from 'mobx'

import { getUser } from '@/apis/user'
import { Loadings } from '@/utils/loadings'

export class UserStore {
  loadings = new Loadings()

  @computed get loading() {
    return this.loadings.isLoading('getUser')
  }

  @observable name = null
  @observable userType = null
  @observable uid = null

  @action updateUser(user) {
    if (!user) {
      this.name = null
      this.userType = null
      this.uid = null
    }
    this.name = user.name
    this.userType = user.type
    this.uid = user.id
  }

  fetch() {
    const fetching = getUser().then(
      user => this.updateUser(user),
      err => {
        if (err && (err.code === 401 || err.code === 403)) {
          this.updateUser(null)
          window.location.href = '/login'
          return
        }
        return Promise.reject(err)
      }
    )
    return this.loadings.promise('getUser', fetching)
  }
}

export default new UserStore()
