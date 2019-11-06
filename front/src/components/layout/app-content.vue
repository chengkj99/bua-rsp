<template>
  <div class="app-content">
    <router-view class="home" name="home"></router-view>
    <div class="split-block">
      <p>厚德笃行   博学尚农</p>
    </div>
    <router-view class="main"></router-view>
    <router-view class="login-wrapper" name="login"></router-view>
  </div>
</template>

<script>
export default {
  name: "app-content",
  data() {
    return {};
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
  .split-block {
    position: relative;
    height: 100px;
    width: 100%;
    background-color: #0f7042;
    background-image: url("../../assets/img/bg.png");
    background-repeat: repeat;
    background-size: cover;

    p {
      text-align: center;
      margin: 0;
      line-height: 100px;
      font-size: 22px;
      color: white;
      word-spacing: 20px;
    }
  }
}
</style>
