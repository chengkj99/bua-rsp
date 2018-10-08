<template>
  <div class='user-product'>
    <product-list :value="userProduct"></product-list>
  </div>
</template>

<script>
import { getUserProduct } from '@/apis/user'
import ProductList from './list'
export default {
  name: 'user-product',
  components: {
    ProductList
  },
  data() {
    return {
      userProduct: []
    }
  },
  methods: {
    getUserProduct(uid) {
      getUserProduct(uid).then(
        data => this.userProduct = data
      )
    }
  },
  created() {
    this.getUserProduct(1)
  }
}
</script>

<style lang='less' scoped>
.user-product {
  position: relative;
  display: block;
}
</style>
