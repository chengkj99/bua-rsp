import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/home/index'
import Product from '@/components/product'
import UserBooking from '@/components/user/booking/index'
import UserAudit from '@/components/user/audit/index'
import UserProduct from '@/components/user/product/index'
import UserLogin from '@/components/user/login/index'
import UserRegister from '@/components/user/register/index'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/home',
      name: 'home',
      components: {
        home: Home
      }
    },
    {
      path: '/product',
      name: 'product',
      component: Product,
      props: route => ({ query: route.query.query })
    },
    {
      path: '/user-booking',
      name: 'user-booking',
      component: UserBooking
    },
    {
      path: '/user-audit',
      name: 'user-audit',
      component: UserAudit
    },
    {
      path: '/user-product',
      name: 'user-product',
      component: UserProduct
    },
    {
      path: '/login',
      name: 'user-login',
      components: {
        login: UserLogin
      }
    },
    {
      path: '/register',
      name: 'user-register',
      components: {
        login: UserRegister
      }
      // component: UserRegister
    }
  ]
})
