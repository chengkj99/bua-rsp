<template>
  <div class="app-content">
    <router-view class="home" name="home"></router-view>
    <split-block v-if="isShowBg"></split-block>
    <router-view class="main"></router-view>
    <router-view class="login-wrapper" name="login"></router-view>
  </div>
</template>

<script>
import SplitBlock from './split-block'

export default {
  name: "app-content",
  components: {
    SplitBlock
  },
  data() {
    return {
      currentRoutePath: ''
    };
  },
  watch: {
    $route: {
      handler(to) {
        this.currentRoutePath = to.path;
      },
      immediate: true
    }
  },
  computed: {
    isShowBg() {
      return this.currentRoutePath !== '/home'
    }
  },
  methods: {}
};
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
