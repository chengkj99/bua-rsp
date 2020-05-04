<template>
  <div class="app-footer">
    <p>© COPYRIGHT 2018-2023</p>
  </div>
</template>

<script>

export default {
  name: 'app-footer'
}
</script>

<style lang='less' scoped>
@import '../../assets/style/color.less';
.app-footer {
  position: 'relative';
  display: block;
  background-color: #ffffff;
  color: #ffffff;
  width: 100%;

  > p {
    text-align: center;
    color: @secondary-font;
    line-height: 68px;
    height: 68px;
    margin: 0;
    border-top: 1px solid #ccc;
  }
}
</style>
