<template>
  <div class="app-head">
    <div class="head-link">
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
    </div>
    <div class="head-content">
      <div class="logo">
        <img src="@/assets/img/school.png">
      </div>
      <div class="search">
        <search-input size="medium" @query="handleQuery"></search-input>
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
      isSignIn: false
    }
  },
  methods: {
    handleQuery(value) {
      console.log('!!!', value)
    }
  }
}
</script>

<style lang='less' scoped>
@import "../../assets/style/index";
@import "./common";

@border-height: 3px;
@height: 60px;

.app-head {
  position: relative;
  display: block;
  width: 100%;
  border-bottom: @border-height solid @logo-color;

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
    .width();

    .logo {
      display: inline-block;
      height: @border-height + @height;
      img {
        height: @height;
        width: auto;
      }
    }

    .search {
      display: inline-block;
      height: @border-height + @height;
      line-height: @border-height + @height;
    }
  }
}
</style>
