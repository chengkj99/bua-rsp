<template>
  <div class="app-head" :style="rootElementStyle">
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
        <span class="block logo-img" @click="handleLogoClick">
          <img src="@/assets/img/school.png">
        </span>
        <span class="block logo-desc" :style="logoDescStyle">
          {{subTitleText}}
        </span>
      </div>
      <!-- <head-logo :subTitle="subTitleText"></head-logo> -->

      <div class="link" v-if="!isLogining">
        <div class="search">
          <search-input size="small" @query="handleQuery"></search-input>
        </div>
        <el-menu
          :default-active="activeIndex"
          mode="horizontal"
          :router="true"
          :unique-opened="true">
          <el-menu-item index="home" class="home-block"></el-menu-item>
          <el-menu-item index="product">产品列表</el-menu-item>
          <el-submenu index="/user" class="user-info" v-if="userName">
            <span slot="title">
              <v-icon name="user" />
              <span class="name-title">{{userName}}</span>
            </span>
            <el-menu-item index="user-booking" v-if="userType === userTypes.user">我的预约</el-menu-item>
            <el-menu-item index="user-product" v-if="userType === userTypes.admin">我的发布</el-menu-item>
            <el-menu-item index="user-audit" v-if="userType === userTypes.admin">我的审核</el-menu-item>
            <el-menu-item index="home" @click="signOut"> 退出 </el-menu-item>
          </el-submenu>
          <template v-if="!userName">
            <el-submenu index="login">
              <span slot="title">
                <v-icon name="user" />
                <span class="name-title">登录</span>
              </span>
              <el-menu-item index="login?type=user">用户登录</el-menu-item>
              <el-menu-item index="login?type=publisher">管理员登录</el-menu-item>
            </el-submenu>
            <el-menu-item index="/4">注册</el-menu-item>
          </template>
        </el-menu>
      </div>
    </div>
  </div>
</template>

<script>
import SearchInput from "../common/search-input.vue"
import HeadLogo from "./head-logo.vue"
import userStore from "@/stores/user"
import { delCookie } from "@/utils/cookies"
import { userTypes } from "@/constants/user"
export default {
  name: "app-head",
  components: {
    SearchInput,
    HeadLogo
  },
  data() {
    return {
      userTypes,
      isSignIn: false,
      activeIndex: "/home"
    };
  },
  watch: {
    $route: {
      handler(to) {
        this.activeIndex = to.path;
      },
      immediate: true
    }
  },
  fromMobx: {
    userName() {
      return userStore.name
    },
    userType() {
      return userStore.userType
    }
  },
  computed: {
    isLogining() {
      return this.activeIndex.search("login") !== -1;
    },
    subTitleText() {
      return this.isLogining ? "欢迎登录大型仪器共享平台" : "大型仪器共享平台";
    },
    rootElementStyle() {
      return this.isLogining ? { height: "90px" } : { height: "60px" };
    },
    logoDescStyle() {
      return this.isLogining ? { fontSize: "18px" } : { height: "13px" };
    }
  },
  methods: {
    handleQuery(value) {
      this.$router.push({ path: "product", query: { query: value } });
    },
    handleLogoClick() {
      this.$router.push("/home");
    },
    signOut() {
      delCookie("uid")
      delCookie("utype")
      window.location.href = "/";
    }
  },
  beforeCreate() {
    userStore.fetch();
  }
};
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
    background-color: #f9f9f9;
    font-size: 12px;
    border-bottom: 1px solid #e7e7e7;

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
    height: inherit;
    .width();

    .logo {
      display: inline-block;
      height: inherit;

      .logo-img {
        transform: scale(0.8, 0.8);

        img {
          height: inherit;
          width: auto;
          vertical-align: middle;
        }
      }

      .logo-desc {
        font-size: 13px;
        color: @secondary-font;
        padding-left: 0;
        padding-top: 2px;
        height: inherit;
        line-height: inherit;
      }
    }

    .block {
      font-size: 13px;
      display: inline-block;
      height: inherit;
      line-height: inherit;
      margin-left: -16px;
    }

    .search {
      display: inline-block;
      height: @height;
      line-height: @height;
      margin-right: 20px;
    }

    .link {
      width: 66%;
      display: flex;
      justify-content: flex-end;
    }

    .home-block {
      display: none;
    }
    .user-info .name-title {
      display: inline-block;
      margin: 0 5px;
    }
  }
}
</style>
