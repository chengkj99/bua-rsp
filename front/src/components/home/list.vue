<template>
  <div class="product-show">
    <div class="card-wrapper">
      <template v-for="product in productList">
        <el-card
          class="card-block"
          :body-style="{ padding: '0px' }"
          :key="product.id"
        >
          <img :src="`${imgDomainName}/${product.img_url}`" class="image">
          <div style="padding: 14px;">
            <span class="name-block" @click="handleViewDetails(product)">{{product.name}}</span>
          </div>
        </el-card>
      </template>
    </div>
    <el-dialog title="产品详情" width="60%" :visible.sync="viewDetailsDialogVisible">
      <product-details :value="details"></product-details>
    </el-dialog>
  </div>
</template>

<script>
import { getProductList } from '@/apis/product'
import { imgDomainName } from '@/constants/product'
import ProductDetails from '../product/details'
export default {
  name: 'product-show',
  components: {
    ProductDetails
  },
  data() {
    return {
      imgDomainName,
      productList: [],
      viewDetailsDialogVisible: false,
      details: {}
    }
  },
  methods: {
    fetch(query = '') {
      getProductList(query).then(
        data => this.productList = data && data.slice(0,10)
      )
    },
    handleViewDetails(product) {
      this.viewDetailsDialogVisible = true
      this.details = { ...product }
    }
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

      .name-block {
        cursor: pointer;

        &:hover {
          text-decoration: underline;
        }
      }
    }
    .image {
      width: 200px;
      height: 200px;
    }
  }
}
</style>
