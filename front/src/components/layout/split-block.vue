<template>
  <div class="split-block">
    <p>厚德笃行 博学尚农</p>
  </div>
</template>

<script>
export default {
  name: "split-block",
  data() {
    return {};
  },
  methods: {}
};
</script>

<style lang='less'>
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
</style>
