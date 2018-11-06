<template>
  <div class='user-product'>
    <div class="opreater">
      <el-button
        size="small"
        type="primary"
        icon="el-icon-circle-plus-outline"
        @click="openDialogOfAddUserProduct" plain>
        新增产品
      </el-button>
    </div>
    <product-list :value="userProduct" @delete="handleDelete"></product-list>

    <el-dialog title="新增产品" :visible.sync="dialogFormVisible">
      <product-form @submit="handleSubmit" @cancel="dialogFormVisible = false"></product-form>
    </el-dialog>
  </div>
</template>

<script>
import { getUserProduct } from '@/apis/user'
import { addProduct, deleteProduct } from '@/apis/product'
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
      dialogFormVisible: false,
      uid: 1
    }
  },
  methods: {
    getUserProduct(uid) {
      getUserProduct(uid).then(
        data => this.userProduct = data
      )
    },
    openDialogOfAddUserProduct() {
      this.dialogFormVisible = true
    },
    handleSubmit(value) {
      const _value = {...value, uid: this.uid}
      addProduct(_value).then(
        () => {
          this.$message.success('添加成功')
          this.dialogFormVisible = false
          this.getUserProduct(this.uid)
        },
        () => {
          this.$message.error('添加失败')
        }
      )
    },
    handleDelete(id) {
      deleteProduct(id).then(
        () => {
          this.$message.success('删除成功')
          this.getUserProduct(this.uid)
        },
        () => {
          this.$message.error('删除失败')
        }
      )
    }
  },
  created() {
    this.getUserProduct(this.uid)
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
