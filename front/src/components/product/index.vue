<template>
  <div class="product">
    <product-list
      :values="productList"
      :utype="utype"
      @booking="handleBooking"
      @view-details="handleViewDetails">
    </product-list>

    <el-dialog title="产品预约" width="50%" :visible.sync="bookingDialogVisible">
      <booking-form
        :price-type="priceType"
        :price-value="priceValue"
        ref="bookingForm"
        @cancel="handleCancelBooking"
        @submit="submitBooking">
      </booking-form>
    </el-dialog>
    <el-dialog title="产品详情" width="60%" :visible.sync="viewDetailsDialogVisible">
      <product-details :value="details"></product-details>
    </el-dialog>
  </div>
</template>

<script>
import { getProductList } from '@/apis/product'
import { addBooking, getProductUsedTimes } from '@/apis/booking'
import SearchInput from '../common/search-input'
import BookingForm from './booking-form'
import ProductList from './list'
import ProductDetails from './details'
import userStore from '@/stores/user'

export default {
  name: 'product',
  props: ['query'],
  components: {
    ProductList,
    BookingForm,
    SearchInput,
    ProductDetails
  },
  data() {
    return {
      productList: [],
      bookingDialogVisible: false,
      productId: -1,
      publisherId: -1,
      productName: '',
      details: {},
      viewDetailsDialogVisible: false,
      usedTimes: [],
      priceType: '',
      priceValue: ''
    }
  },
  fromMobx: {
    uid() {
      return userStore.uid
    },
    username() {
      return userStore.name
    },
    utype() {
      return userStore.userType
    },
  },
  methods: {
    fetch(query = '') {
      getProductList(query).then(
        data => this.productList = data
      )
    },
    getProductUsedTimes(id) {
      getProductUsedTimes(id).then(data => this.usedTimes = data ? data.map(item => ({startTime: item.start_time, endTime: item.end_time})) : [])
    },
    handleBooking(product) {
      this.getProductUsedTimes(product.id)
      this.productId = product.id
      this.publisherId = product.publisherId
      this.productName = product.name
      this.priceType = product.price_type
      this.priceValue = product.price_value
      this.bookingDialogVisible = true
    },
    submitBooking(value) {
      const localValue = {
        ...value,
        uid: this.uid,
        username: this.username,
        productId: this.productId,
        publisherId: this.publisherId,
        productName: this.productName
      }
      addBooking(localValue).then(
        () => {
          this.$message.success('预约成功')
          this.handleCancelBooking()
        },
        () => { this.$message.error('预约失败') }
      )
    },
    handleCancelBooking() {
      this.$refs.bookingForm.$refs.form.resetFields()
      this.bookingDialogVisible = false
    },
    handleViewDetails(row) {
      this.viewDetailsDialogVisible = true
      this.details = { ...row }
    }
  },
  created() {
    this.$watch('query', value => {
      value ? this.fetch(value) : this.fetch()
    }, {
      immediate: true
    })
  }
}
</script>

<style lang='less' scoped>
.product {
  position: relative;
  display: block;

  .search-block {
    margin: 20px 0;
    text-align: right;
  }
}
</style>
