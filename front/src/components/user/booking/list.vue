<template>
  <!--用户预约列表-->
  <div class='user-booking-list'>
    <table-page :data="value">
      <el-table-column label="产品名称">
        <template slot-scope="scope">
           {{ scope.row.product_name }}
        </template>
      </el-table-column>
      <el-table-column label="预约开始时间">
        <template slot-scope="scope">
           {{ scope.row.start_time }}
        </template>
      </el-table-column>
      <el-table-column label="预约结束时间">
        <template slot-scope="scope">
           {{ scope.row.end_time }}
        </template>
      </el-table-column>
      <el-table-column label="申请理由">
        <template slot-scope="scope">
           {{ scope.row.reason || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="审核回复">
        <template slot-scope="scope">
           {{ scope.row.reply || '-' }}
        </template>
      </el-table-column>
      <el-table-column label="状态">
        <template slot-scope="scope">
          <el-tag :type="bookingStatusStyle[scope.row.status]">
            {{ bookingStatusMap[scope.row.status] }}
          </el-tag>
        </template>
      </el-table-column>
    </table-page>
  </div>
</template>

<script>
import TablePage from '@/components/common/table-page'
import { bookingStatusMap, bookingStatusStyle } from '@/constants/booking'

export default {
  name: 'user-booking-list',
  props: ['value'],
  components: {
    TablePage
  },
  data() {
    return {
      bookingStatusMap,
      bookingStatusStyle,
      dialogVisible: false,
    }
  }
}
</script>

<style lang='less' scoped>
.user-booking-list {
  position: relative;
  display: block;
}
</style>
