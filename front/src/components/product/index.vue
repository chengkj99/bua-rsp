<template>
  <div class="product">
    value: {{value}}
  </div>
</template>

<script>
import { getProductList } from '@/apis/product'
export default {
  name: 'product',
  data() {
    return {
      value: []
    }
  },
  methods: {
    fetch(query = '') {
      getProductList(query).then(
        res => this.value = res.data
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
}
</style>
