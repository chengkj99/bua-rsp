<template>
  <div class="app-content">
    <router-view class="home" name="home"></router-view>
    <router-view class="main"></router-view>
    <router-view class="login-wrapper" name="login"></router-view>
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
@import "./common";

.app-content {
  position: relative;
  display: block;
  margin-top: 60px;

  .main {
    .width();
  }
  .login-wrapper {
    background: #f0f4f3;
  }
}
</style>
