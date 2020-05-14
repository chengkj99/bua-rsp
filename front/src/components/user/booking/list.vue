<template>
  <!--用户预约列表-->
  <div class="user-booking-list">
    <table-page :data="tableData">
      <el-table-column label="产品名称">
        <template slot-scope="scope">{{ scope.row.product_name }}</template>
      </el-table-column>
      <el-table-column label="预约开始时间">
        <template slot-scope="scope">{{ scope.row.start_time }}</template>
      </el-table-column>
      <el-table-column label="预约结束时间">
        <template slot-scope="scope">{{ scope.row.end_time }}</template>
      </el-table-column>
      <el-table-column label="申请理由">
        <template slot-scope="scope">
          <el-input
            type="textarea"
            readonly
            :autosize="{ minRows: 1, maxRows: 4}"
            :value="scope.row.reason || '无'"
          ></el-input>
        </template>
      </el-table-column>
      <el-table-column label="审核回复">
        <template slot-scope="scope">
          <el-input
            type="textarea"
            readonly
            :autosize="{ minRows: 1, maxRows: 4}"
            :value="scope.row.reply || '无'"
          ></el-input>
        </template>
      </el-table-column>
      <el-table-column label="状态">
        <template slot-scope="scope">
          <el-tag
            :type="bookingStatusStyle[scope.row.status]"
          >{{ bookingStatusMap[scope.row.status] }}</el-tag>
          <el-button
            class="pay-btn"
            type="text"
            size="small"
            @click="payment(scope.row)"
            v-if="bookingStatuses.agree === scope.row.status"
          >立即支付</el-button>
        </template>
      </el-table-column>
    </table-page>
  </div>
</template>

<script>
import TablePage from "@/components/common/table-page";
import {
  bookingStatuses,
  bookingStatusMap,
  bookingStatusStyle
} from "@/constants/booking";
import { getPayUrl } from "@/apis/pay";
import { updateBooing } from "@/apis/booking";
import { log } from "util";

export default {
  name: "user-booking-list",
  props: ["value"],
  components: {
    TablePage
  },
  data() {
    return {
      bookingStatuses,
      bookingStatusMap,
      bookingStatusStyle,
      dialogVisible: false,
      localValue: [],
      outTradeNo: ""
    };
  },
  watch: {
    value: {
      handler(newValue, oldValue) {
        this.localValue = [...newValue];
      },
      immediate: true,
      deep: true
    },
    $route: {
      handler(to) {
        this.outTradeNo = to.query.out_trade_no;
      },
      immediate: true
    }
  },
  computed: {
    tableData() {
      if (!this.outTradeNo) {
        return this.localValue;
      }
      const [time, productId, bookingId] = this.outTradeNo.split("/");
      const index = this.localValue.findIndex(
        item => item.id == bookingId && item.product_id == productId
      );
      return this.localValue.map(item => {
        if (item.id == bookingId && item.product_id == productId) {
          item.status = bookingStatuses.paid;
          this.updatePaisStatus(item);
        }
        return item;
      });
    }
  },
  methods: {
    payment(value) {
      const {
        product_id: productId,
        id: bookingId,
        product_name: productName,
        total_price: totalAmount
      } = value;
      const timestamp = +new Date();
      const productIdOfTime = `${timestamp}/${productId}`;
      getPayUrl(productIdOfTime, bookingId, totalAmount, productName).then(
        res => {
          const { data } = res;
          window.location.href = data;
        }
      );
    },
    updatePaisStatus(value) {
      updateBooing(value);
    }
  }
};
</script>

<style lang='less' scoped>
.user-booking-list {
  position: relative;
  display: block;

  .pay-btn {
    margin-left: 10px;
  }
}
</style>
