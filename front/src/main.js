// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import Movue from 'movue'
import * as mobx from 'mobx'
import ElementUI from 'element-ui'
// import "element-ui/lib/theme-chalk/index.css"
import '../static/element-#0F7042/index.css'
import 'vue-awesome/icons'
import Icon from 'vue-awesome/components/Icon.vue'
import axios from 'axios'

Vue.component('v-icon', Icon)
Vue.use(ElementUI)
Vue.use(Movue, mobx)
Vue.config.productionTip = false

router.beforeEach((to, from, next) => {
  if (to.path === '/') {
    next('/home')
    return
  }
  next()
})

axios.interceptors.response.use(
  ({ status, data: result }) => {
    if (result.code) {
      const { code, data } = result
      if (code !== 200) {
        return Promise.reject(result)
      }
      return data
    }
    return result
  },
  error => {
    return Promise.reject(error)
  }
)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
