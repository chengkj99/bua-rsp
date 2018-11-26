<template>
  <div class='user-booking'>
    <booking-list :value="value"></booking-list>
  </div>
</template>

<script>
import { getUserBookingList } from '@/apis/booking'
import BookingList from './list'
import userStore from '@/stores/user'
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
  fromMobx: {
    uid() {
      return userStore.uid
    }
  },
  methods: {
    fetch(uid) {
      getUserBookingList(uid).then(
        data => this.value = data
      )
    }
  },
  mounted() {
    this.$watch(
      'uid',
      value => (value && this.fetch(value)),
      { immediate: true }
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
