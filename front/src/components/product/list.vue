<template>
  <div class="product-list">
    <el-table
      :data="currentValues"
      align="left"
      style="width: 100%">
      <el-table-column label="图片">
        <template slot-scope="scope">
          <img class="img-block" :src="`${imgDomainName}/${scope.row.img_url}`" alt="仪器图片">
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
            @click="handleViewDetails(scope.row)">
            详情
          </el-button>
          <el-button
            size="mini"
            @click="handleBooking(scope.row)"
            v-if="utype === userTypes.user">
            预约
          </el-button>
        </template>
      </el-table-column>
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
import { statusNameMap, statusesStyle, imgDomainName } from '@/constants/product'
import { userTypes } from '@/constants/user'
export default {
  name: 'product-list',
  props: ['values', 'utype'],
  data() {
    return {
      statusNameMap,
      statusesStyle,
      imgDomainName,
      userTypes,
      currentPage: 1,
      pageSize: 13
    }
  },
  computed: {
    total() {
      return this.values && this.values.length
    },
    currentValues() {
      let start = (this.currentPage - 1) * this.pageSize
      return this.values ? this.values.slice(start, start + this.pageSize) : []
    }
  },
  methods: {
    handleBooking(row) {
      this.$emit('booking', row.id, row.pbulisher_id, row.name)
    },
    handleViewDetails(row) {
      this.$emit('view-details', row)
    }
  }
}
</script>

<style lang='less' scoped>
.product-list {
  position: relative;
  display: block;

  .page-wrapper {
    text-align: right;
    padding: 10px 0;
  }
  .img-block {
    width: 160px;
    height: 160px;
  }
}
</style>
