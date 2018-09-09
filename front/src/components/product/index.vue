<template>
  <div class="product">
    <div class="search-block">
      <el-row :gutter="20">
        <el-col :span="16">

        </el-col>
        <el-col :span="8">

        </el-col>
      </el-row>
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
