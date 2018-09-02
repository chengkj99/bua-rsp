import Vue from 'vue'
import Router from 'vue-router'
import FeatureA from '@/components/feature-a'
import Product from '@/components/product'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'FeatureA',
      component: FeatureA
    },
    {
      path: '/product',
      name: 'product',
      component: Product
    }
  ]
})
