<template>
  <div class="home">
    <el-carousel class="carousel-block" height="500px">
      <el-carousel-item>
        <img src="./share.gif" alt="共享经济，向科研仪器迈进"/>
      </el-carousel-item>
    </el-carousel>
  </div>
</template>

<script>
export default {
  name: 'home',
  data() {
    return {}
  },
  methods: {
  }
}
</script>

<style lang="less" scoped>
.home {
  position: relative;
  display: block;
  width: 100%;

  .carousel-block {
    height: 500px;

    img {
      margin-left: -960px;
      width: 1920px;
      height: 500px;
      position: absolute;
      left: 50%;
    }
  }
}
</style>
