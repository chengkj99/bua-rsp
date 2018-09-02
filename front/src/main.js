// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import Movue from 'movue'
import * as mobx from 'mobx'

import ElementUI from 'element-ui'
// import 'element-ui/lib/theme-chalk/index.css'
import '../static/element-#0F7042/index.css'

Vue.use(ElementUI)
Vue.use(Movue, mobx)
Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
