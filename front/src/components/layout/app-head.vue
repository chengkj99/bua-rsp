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

      <!-- <div class="search">
        <search-input size="medium" @query="handleQuery"></search-input>
      </div> -->
      <el-row :gutter="20">
        <el-col :span="4">
          <div class="logo">
            <img src="@/assets/img/school.png">
          </div>
        </el-col>
        <el-col :span="16">
          <div class="menu-wrapper">
            <el-menu
              :default-active="activeIndex"
              class="menu-block"
              mode="horizontal"
              @select="handleSelect"
              background-color="#0F7042"
              text-color="#fff"
              active-text-color="#ffd04b">
              <el-menu-item class="muen-item-block" index="1">产品列表</el-menu-item>
              <el-menu-item class="muen-item-block" index="2">我的预约</el-menu-item>
            </el-menu>
          </div>
        </el-col>
        <el-col :span="8"><div class="grid-content bg-purple"></div></el-col>
      </el-row>
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
      console.log('!!!', value)
    },
    handleSelect() {}
  }
}
</script>

<style lang='less' scoped>
@import "../../assets/style/index";
@import "./common";

@border-height: 1px;
@height: 40px;

.app-head {
  position: relative;
  display: block;
  width: 100%;
  border-bottom: @border-height solid @logo-color;
  background: @logo-color;

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

  .menu-wrapper {
    position: relative;
    display: block;
    background: @logo-color;
    .menu-block {
      .width();

      .muen-item-block {
        height: 46px;
        line-height: 46px;
      }
    }
    .el-menu--horizontal {
      border: none;
    }
  }
}
</style>
