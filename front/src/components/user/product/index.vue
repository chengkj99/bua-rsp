<template>
  <div class='user-product'>
    <div class="opreater">
      <el-button
        size="small"
        type="primary"
        icon="el-icon-circle-plus-outline"
        @click="addUserProduct" plain>
        新增产品
      </el-button>
    </div>
    <product-list :value="userProduct"></product-list>

    <el-dialog title="新增产品" :visible.sync="dialogFormVisible">
      <product-form @submit="addUserProduct" @cancel="dialogFormVisible = false"></product-form>
    </el-dialog>
  </div>
</template>

<script>
import { getUserProduct } from '@/apis/user'
import ProductList from './list'
import ProductForm from './form'
export default {
  name: 'user-product',
  components: {
    ProductList,
    ProductForm
  },
  data() {
    return {
      userProduct: [],
      dialogFormVisible: false
    }
  },
  methods: {
    getUserProduct(uid) {
      getUserProduct(uid).then(
        data => this.userProduct = data
      )
    },
    addUserProduct() {
      this.dialogFormVisible = true
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

  .opreater {
    height: 40px;
    line-height: 40px;
    padding: 10px 0;
    text-align: right;
  }
}
</style>
