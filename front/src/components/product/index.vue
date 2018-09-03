<template>
  <div class="product">
    <div class="search-block">
    </div>
    <product-list :values="productList"></product-list>
  </div>
</template>

<script>
import { getProductList } from '@/apis/product'
import ProductList from './list'
export default {
  name: 'product',
  components: {
    ProductList
  },
  data() {
    return {
      productList: []
    }
  },
  methods: {
    fetch(query = '') {
      getProductList(query).then(
        data => this.productList = data
      )
    }
  },
  created() {
    this.fetch()
  }
}
</script>

<style lang='less' scoped>
.product {
  position: relative;
  display: block;

  .search-block {
    margin: 20px 0;
  }
}
</style>
