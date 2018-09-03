<template>
  <div class="product-list">
    <el-table
      :data="values"
      align="left"
      style="width: 100%">
      <el-table-column label="图片">
        <template slot-scope="scope">
          {{ scope.row.img_url || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="名称">
        <template slot-scope="scope">
           {{ scope.row.name }}
        </template>
      </el-table-column>
      <el-table-column label="厂商型号">
        <template slot-scope="scope">
           {{ scope.row.firm_model }}
        </template>
      </el-table-column>
      <el-table-column label="性能参数">
        <template slot-scope="scope">
           {{ scope.row.parameter }}
        </template>
      </el-table-column>
      <el-table-column label="状态">
        <template slot-scope="scope">
          <el-tag :type="statusesStyle[scope.row.status]">
            {{ statusNameMap[scope.row.status] }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button
            size="mini"
            @click="handleBooking(scope.row)">
            预约
          </el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import { statuses, statusNameMap } from '@/constants/product'

const statusesStyle = {
  [statuses.enable]: 'success',
  [statuses.disable]: 'info'
}

export default {
  name: 'product-list',
  props: ['values'],
  data() {
    return {
      statusNameMap,
      statusesStyle
    }
  },
  methods: {
    handleBooking(row) {
      console.log('booking', row)
    }
  }
}
</script>

<style lang='less' scoped>
.product-list {
  position: relative;
  display: block;
}
</style>
