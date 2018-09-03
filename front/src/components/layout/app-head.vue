<template>
  <div class="app-head">
    <div class="head-block">
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
    return {}
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
  padding: 6px 0;

  .head-block {
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
