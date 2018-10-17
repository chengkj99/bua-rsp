<template>
  <div class='user-booking-list'>
    <table-page :data="localValue">
      <el-table-column label="预约人姓名">
        <template slot-scope="scope">
          {{scope.row.booking_man}}
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
      <el-table-column label="原因">
        <template slot-scope="scope">
           {{ scope.row.reason || '无' }}
        </template>
      </el-table-column>
      <el-table-column label="状态">
        <template slot-scope="scope">
          <el-tag :type="bookingStatusStyle[scope.row.is_agree]">
            {{ bookingStatusNameMap[scope.row.is_agree] }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button
            size="mini"
            @click="approve(scope.row)">
            通过
          </el-button>
        </template>
      </el-table-column>
    </table-page>
  </div>
</template>

<script>
import TablePage from '@/components/common/table-page'
import { bookingStatusNameMap, bookingStatusStyle } from '@/constants/product'

export default {
  name: 'user-booking-list',
  props: ['value'],
  components: {
    TablePage
  },
  data() {
    return {
      bookingStatusNameMap,
      bookingStatusStyle,
      dialogVisible: false,
      localValue: []
    }
  },
  watch: {
    value: {
      handler(value) {
        this.localValue = value.map(obj => ({ ...obj }))
      }
    },
    immediuate: true,
    deep: true
  },
  methods: {
    approve(row) {
      const textTips = `此操作将同意 ${row.booking_man} 的预约申请操作，是否继续？`
      this.$confirm(textTips, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
        center: false
      }).then(() => {
        console.log('do...')
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消操作'
        })
      })
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
