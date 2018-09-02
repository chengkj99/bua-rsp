<template>
  <div class="app-head">
    <div class="head-block">
      <div class="logo">
        <img src="@/assets/img/school.png">
      </div>
      <div class="search">
        <el-input
          class="query-input"
          v-model="value"
          placeholder="请输入产品名称进行查询"
          size="medium"
          @keyup.enter.native="handleQuery">
          <i slot="suffix" class="el-input__icon el-icon-search" @click="handleQuery"></i>
        </el-input>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'app-head',
  data() {
    return {
      value: ''
    }
  },
  methods: {
    handleQuery() {
      console.log('!!!', this.value)
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

      .query-input {
        width: 260px;
        line-height: @border-height + @height;
      }
    }
  }
}
</style>
