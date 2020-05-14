<template>
  <div class="user-booking-list">
    <table-page :data="localValue">
      <el-table-column label="预约人姓名">
        <template slot-scope="scope">{{scope.row.booking_name}}</template>
      </el-table-column>
      <el-table-column label="产品名称">
        <template slot-scope="scope">{{ scope.row.product_name }}</template>
      </el-table-column>
      <el-table-column label="预约开始时间">
        <template slot-scope="scope">{{ humanizeTime(scope.row.start_time) }}</template>
      </el-table-column>
      <el-table-column label="预约结束时间">
        <template slot-scope="scope">{{ humanizeTime(scope.row.end_time) }}</template>
      </el-table-column>
      <el-table-column label="申请理由" width="200">
        <template slot-scope="scope">
          <el-input
            type="textarea"
            readonly
            :autosize="{ minRows: 1, maxRows: 4}"
            :value="scope.row.reason || '无'"
          ></el-input>
        </template>
      </el-table-column>
      <el-table-column label="回复内容"  width="200">
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
          >{{ bookingStatusMapForAudit[scope.row.status] }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="180">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="danger"
            :disabled="scope.row.status !== bookingStatuses.notDo"
            @click="onReject(scope.row)"
          >拒绝</el-button>
          <el-button
            size="mini"
            type="success"
            :disabled="scope.row.status !== bookingStatuses.notDo"
            @click="onApprove(scope.row)"
          >通过</el-button>
        </template>
      </el-table-column>
    </table-page>
  </div>
</template>

<script>
import TablePage from "@/components/common/table-page";
import {
  bookingStatuses,
  bookingStatusMapForAudit,
  bookingStatusStyle
} from "@/constants/booking";
import moment from "moment";

export default {
  name: "user-booking-list",
  props: ["value"],
  components: {
    TablePage
  },
  data() {
    return {
      bookingStatuses,
      bookingStatusMapForAudit,
      bookingStatusStyle,
      dialogVisible: false,
      localValue: []
    };
  },
  watch: {
    value: {
      handler(value) {
        this.localValue = value.map(obj => ({ ...obj }));
      }
    },
    immediuate: true,
    deep: true
  },
  methods: {
    onApprove(row) {
      const textTips = `此操作将同意 ${
        row.booking_name
      } 的预约申请操作，请输入回复信息:`;
      this.$prompt(textTips, "申请通过", {
        confirmButtonText: "确定",
        cancelButtonText: "取消"
      }).then(({ value }) => {
        this.$emit("approve", {
          ...row,
          reply: value,
          status: bookingStatuses.agree
        });
      });
    },
    onReject(row) {
      const textTips = `此操作将拒绝 ${
        row.booking_name
      } 的预约申请操作，请输入拒绝原因:`;
      this.$prompt(textTips, "申请拒绝", {
        confirmButtonText: "确定",
        cancelButtonText: "取消"
      }).then(({ value }) => {
        this.$emit("reject", {
          ...row,
          reply: value,
          status: bookingStatuses.reject
        });
      });
    },
    humanizeTime(time) {
      return moment.unix(time).format("YYYY-MM-DD");
    },
    isBtnVisible() {}
  }
};
</script>

<style lang='less' scoped>
.user-booking-list {
  position: relative;
  display: block;
}
</style>
