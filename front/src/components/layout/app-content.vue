<template>
  <div class="app-content">
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'app-content',
  data() {
    return {}
  },
  methods: {
  }
}
</script>

<style lang='less' scoped>
.app-content {
  position: relative;
  display: block;
}
</style>
