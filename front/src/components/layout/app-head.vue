<template>
  <div class="app-head">
    <!-- <div class="head-link">
      <template v-if="isSignIn">
        <span>欢迎您</span>
        <span>我的预约</span>
        <span>进入后台</span>
        <span>退出登录</span>
      </template>
      <template v-else>
        <span>
          <el-button type="text" class="signin-btn">您好，请登录</el-button>
        </span>
        <span>
          <el-button type="text" class="register-btn">注册</el-button>
        </span>
      </template>
    </div> -->
    <div class="head-content">
      <div class="logo">
        <span class="block" @click="handleLogoClick">
          <img src="@/assets/img/school.png">
        </span>
        <span class="block logo-desc">
          仪器共享服务中心
        </span>
      </div>
      <div class="link">
        <div class="search">
          <search-input size="small" @query="handleQuery"></search-input>
        </div>
        <el-menu :default-active="activeIndex" mode="horizontal" router @select="handleSelect">
          <el-menu-item index="/product">我的产品</el-menu-item>
          <el-menu-item index="2">我的预约</el-menu-item>
          <el-menu-item index="3">登录</el-menu-item>
          <el-menu-item index="4"><a href="https://www.ele.me" target="_blank">注册</a></el-menu-item>
        </el-menu>
      </div>
    </div>
  </div>
</template>

<script>
import SearchInput from '../common/search-input.vue'
export default {
  name: 'app-head',
  components: {
    SearchInput
  },
  data() {
    return {
      isSignIn: false,
      activeIndex: '1'
    }
  },
  methods: {
    handleQuery(value) {
      this.$router.push({ path: 'product', query: { query: value }})
    },
    handleSelect() {},
    handleLogoClick() {
      this.$router.push('/')
    }
  }
}
</script>

<style lang='less' scoped>
@import "../../assets/style/index";
@import "./common";

@border-height: 1px;
@height: 60px;

.app-head {
  position: fixed;
  top: 0;
  z-index: 100;
  display: block;
  width: 100%;
  border-bottom: @border-height solid #e6e6e6;
  background: #ffffff;

  .head-link {
    height: 20px;
    line-height: 20px;
    text-align: right;
    background-color: #F9F9F9;
    font-size: 12px;
    border-bottom: 1px solid #E7E7E7;

    > span {
      display: inline-block;
      margin-right: 10px;
    }

    .signin-btn {
      padding: 0;
      margin: 0;
      font-size: 12px;
    }
    .register-btn {
      padding: 0;
      margin: 0;
      font-size: 12px;
      color: #606266;
    }
  }

  .head-content {
    display: flex;
    flex-flow: row nowrap;
    justify-content: space-between;
    height: @height;
    .width();

    .logo {
      display: inline-block;
      height: @height;

      img {
        height: @height - 14px;
        width: auto;
        vertical-align: middle;
      }

      .logo-desc {
        font-size: 12px;
        color: @secondary-font;
        vertical-align: top;
        padding-left: 0;
        padding-top: 2px;
      }
    }

    .block {
      font-size: 13px;
      display: inline-block;
      height: @height;;
      line-height: @height;
      padding-left: 10px;
    }

    .search {
      display: inline-block;
      height: @height;
      line-height: @height;
    }

    .link {
      width: 70%;
      display: flex;
      justify-content: flex-end;
    }
  }
}
</style>
