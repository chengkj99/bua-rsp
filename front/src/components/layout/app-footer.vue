<template>
  <div class="app-footer">
    <p>© 2018-2023 北京农学院 版权所有</p>
  </div>
</template>

<script>
export default {
  name: 'app-footer',
  data() {
    return {}
  },
  methods: {
  }
}
</script>

<style lang='less' scoped>
.app-footer {
  position: absolute;
  display: block;
  height: 200px;
  bottom: 0;
  background-color: #ccc;
  width: 100%;
  > p {
    text-align: center;
  }
}
</style>
