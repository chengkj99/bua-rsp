<template>
  <div class="table-page">
    <el-table
      :data="currentValues"
      align="left"
      style="width: 100%">
      <slot></slot>
    </el-table>

    <div class="page-wrapper">
      <el-pagination
        background
        :page-size="pageSize"
        layout="prev, pager, next"
        :total="total"
        :current-page.sync="currentPage">
      </el-pagination>
    </div>
  </div>
</template>

<script>
export default {
  name: 'table-page',
  props: ['data'],
  data() {
    return {
      currentPage: 1,
      pageSize: 13
    }
  },
  computed: {
    total() {
      return this.data && this.data.length
    },
    currentValues() {
      let start = (this.currentPage - 1) * this.pageSize
      return this.data ? this.data.slice(start, start + this.pageSize) : []
    }
  }
}
</script>

<style lang='less' scoped>
.table-page {
  position: relative;
  display: block;

  .page-wrapper {
    text-align: right;
    padding: 10px 0;
  }
}
</style>
