<template>
  <div class="product-show">
   <div class="card-wrapper">
     <template v-for="product in productList">
        <el-card  class="card-block" :body-style="{ padding: '0px' }" :key="product.id">
          <img :src="`${imgDomainName}/${product.img_url}`" class="image">
          <div style="padding: 14px;">
            <span>{{product.name}}</span>
            <!-- <div class="bottom clearfix">
              <time class="time">{{ currentDate }}</time>
              <el-button type="text" class="button">操作按钮</el-button>
            </div> -->
          </div>
        </el-card>
     </template>
   </div>
  </div>
</template>

<script>
import { getProductList } from '@/apis/product'
import { imgDomainName } from '@/constants/product'

export default {
  name: 'product-show',
  data() {
    return {
      productList: [],
      imgDomainName
    }
  },
  methods: {
    fetch(query = '') {
      getProductList(query).then(
        data => this.productList = data && data.slice(0,10)
      )
    },
  },
  created() {
    this.fetch()
  }
}
</script>

<style lang='less' scoped>
.product-show {
  position: relative;
  display: block;

  .card-wrapper {
    display: flex;
    justify-content: space-between;
    flex-flow: row wrap;
    width: 1170px;
    margin: 0 auto;
    padding: 30px 0;

    .card-block {
      padding: 0px;
      margin-bottom: 20px;
    }
    .image {
      width: 200px;
      height: 200px;
    }
  }
}
</style>
