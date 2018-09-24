import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/home/index'
import Product from '@/components/product'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'home',
      components: {
        home: Home
      }
    },
    {
      path: '/product',
      name: 'product',
      component: Product
    }
  ]
})
