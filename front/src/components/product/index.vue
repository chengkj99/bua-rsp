<template>
  <div class="product">
    <div class="search-block">
      <el-row :gutter="20">
        <el-col :span="16"></el-col>
        <el-col :span="8"></el-col>
      </el-row>
    </div>
    <product-list
      :values="productList"
      @booking="handleBooking">
    </product-list>

  <el-dialog title="产品预约" width="50%" :visible.sync="bookingDialogVisible">
    <booking-form
      :pid="productId"
      ref="bookingForm"
      @cancel="handleCancelBooking"
      @submit="submitBooking">
    </booking-form>
  </el-dialog>

  </div>
</template>

<script>
import { getProductList } from '@/apis/product'
import { addBooking } from '@/apis/booking'
import BookingForm from './booking-form'
import ProductList from './list'
export default {
  name: 'product',
  components: {
    ProductList,
    BookingForm
  },
  data() {
    return {
      productList: [],
      bookingDialogVisible: false,
      productId: -1
    }
  },
  methods: {
    fetch(query = '') {
      getProductList(query).then(
        data => this.productList = data
      )
    },
    handleBooking(pid) {
      this.productId = pid
      this.bookingDialogVisible = true
    },
    submitBooking(value) {
      addBooking(value).then(
        () => {
          this.$message.success('添加成功')
          this.handleCancelBooking()
        },
        () => { this.$message.error('添加失败') }
      )
    },
    handleCancelBooking() {
      this.$refs.bookingForm.$refs.form.resetFields()
      this.bookingDialogVisible = false
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
