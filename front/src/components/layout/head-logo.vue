<template>
  <div class="head-logo" :style="elementStyle">
    <div class="logo" :style="elementStyle2">
      <span class="block" @click="handleLogoClick">
        <img src="@/assets/img/school.png" :style="elementStyle3">
      </span>
      <span class="block logo-desc">
        {{subTitle}}
      </span>
    </div>
  </div>
</template>

<script>
export default {
  name: "head-logo",
  props: {
    subTitle: {
      default: '大型仪器共享平台'
    },
    height: {
      default: 60
    }
  },
  computed: {
    elementStyle: {
      height: this.height + 'px'
    },
    elementStyle2: {
      height: this.height + 'px',
      lineHeight: this.height + 'px'
    },
    elementStyle3: {
      height: (this.height-14) + 'px'
    }
  }
}
</script>

<style lang='less' scoped>
@import "../../assets/style/index";
@import "./common";

.head-logo {
  position: relative;
  .logo {
    display: inline-block;

    img {
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
}
</style>
