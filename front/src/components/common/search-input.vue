<template>
  <el-input
    class="query-input"
    v-model="value"
    placeholder="请输入产品名称进行查询"
    :size="size"
    @keyup.enter.native="handleQuery">
    <i slot="suffix" class="el-input__icon el-icon-search" @click="handleQuery"></i>
  </el-input>
</template>

<script>
export default {
  name: 'search-input',
  props: {
    size: {
      default: 'small',
      type: String
    }
  },
  data() {
    return {
      value: ''
    }
  },
  methods: {
    handleQuery() {
      this.$emit('query', this.value)
    }
  }
}
</script>

<style lang='less' scoped>
.query-input {
  position: relative;
  display: inline-block;
  width: 260px;
}
</style>
