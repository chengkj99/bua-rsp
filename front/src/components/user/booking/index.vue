<template>
  <div class='user-booking'>
    value: {{ value }}
  </div>
</template>

<script>
import { getBookingList } from '@/apis/booking'

export default {
  nanm: 'user-booking',
  props: [],
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
