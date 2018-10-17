<template>
  <div class='user-booking'>
    <booking-list :value="value"></booking-list>
  </div>
</template>

<script>
import { getBookingList } from '@/apis/booking'
import BookingList from './list'

export default {
  nanm: 'user-booking',
  components: {
    BookingList
  },
  data() {
    return {
      value: []
    }
  },
  methods: {},
  created() {
    getBookingList().then(
      data => this.value = data
    )
  }
}
</script>

<style lang='less' scoped>
.user-booking {
  position: relative;
  display: block;
}
</style>
