<template>
  <div class="booking-form">
    <el-form ref="form" :model="form" :rules="rules" label-width="80px" size="small">
      <el-form-item label="计费类型">
        <el-tag class="tag-block">{{priceTypeNames[priceType] || '暂未设定'}}</el-tag>
      </el-form-item>
      <el-form-item label="预约日期" prop="times" v-if="!isSubtimesVisible">
        <el-date-picker
          v-model="form.times"
          style="width: 100%"
          type="daterange"
          range-separator="至"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
          :picker-options="pickerOptions"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="预约日期" prop="times" v-if="isSubtimesVisible">
        <el-date-picker v-model="form.subDate" type="date" placeholder="选择日期"></el-date-picker>
      </el-form-item>
      <el-form-item label="使用时长" prop="subtimes" v-if="isSubtimesVisible">
        <el-time-picker
          style="width: 100%"
          is-range
          v-model="form.subtimes"
          range-separator="至"
          start-placeholder="开始时间"
          end-placeholder="结束时间"
          placeholder="选择时间范围"
        ></el-time-picker>
      </el-form-item>
      <el-form-item label="预期费用">
        <el-tag class="tag-block">{{possiblePrice}} 元</el-tag>
      </el-form-item>
      <el-form-item label="预约备注" prop="reason">
        <el-input type="textarea" rows="4" v-model.trim="form.reason" placeholder="请输入预约理由"></el-input>
      </el-form-item>
      <el-form-item>
        <div class="btn-wrapper">
          <el-button @click="cancel">取消</el-button>
          <el-button type="primary" @click="onSubmit">申请预约</el-button>
        </div>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import moment from "moment";
import { priceTypeNames, priceTypes } from "@/constants/booking.js";
const D = new Date();
const y = D.getYear();
const m = D.getMonth();
const d = D.getDate();
const initialForm = {
  name: "",
  times: [],
  subDate: new Date(),
  subtimes: [new Date(y, m, d, 8, 0), new Date(y, m, d, 18, 0)],
  reason: ""
};
const initialRules = {
  times: [{ required: true, message: "请输入预约日期" }],
  subtimes: [{ required: true, message: "请输入预约日期时间段" }],
  reason: [{ required: true, message: "请输入备注信息" }]
};

const isInDisableTimeRange = (timeRanges, t) => {
  return timeRanges.some(range => {
    return t >= range.startTime * 1000 && t <= range.endTime * 1000;
  });
  return new Date(t).getTime();
};

const resetTargetSecondTime = (originDate, h = 23, m = 59, s = 59, ms = 59) => {
  const t = new Date(originDate);
  t.setHours(h);
  t.setMinutes(m);
  t.setSeconds(s);
  t.setMilliseconds(ms);
  return parseInt(t.getTime() / 1000, 10);
};
export default {
  name: "booking-form",
  props: ["priceType", "priceValue"],
  data() {
    return {
      priceTypeNames,
      form: { ...initialForm },
      rules: initialRules,
      pickerOptions: {}
    };
  },
  computed: {
    isSubtimesVisible() {
      return this.priceType === priceTypes.hour;
    },
    valueForSubmit() {
      let { name, reason, times } = this.form;
      let [startTime, endTime] = times;
      return {
        reason,
        startTime: resetTargetSecondTime(startTime, 0, 0, 0, 0),
        endTime: resetTargetSecondTime(endTime, 23, 59, 59, 59),
        totalPrice: this.possiblePrice
      };
    },
    possiblePrice() {
      let n = 1;
      if (this.priceType === priceTypes.day) {
        const [startTime, endTime] = this.form.times;
        const tempTime = moment.duration(endTime - startTime);
        n = tempTime.days() + 1 || n;
      }
      if (this.priceType === priceTypes.times) {
        n = 1;
      }
      if (this.priceType === priceTypes.hour) {
        const [startTime, endTime] = this.form.subtimes;
        const tempTime = moment.duration(endTime - startTime);
        n = tempTime.hours() + 1 || n;
      }
      return n * this.priceValue;
    }
  },
  watch: {
    times: {
      handler(value) {
        if (value) {
          this.pickerOptions = {
            disabledDate(time) {
              return isInDisableTimeRange(value, time.getTime());
            }
          };
        }
      }
    },
    immediuate: true,
    deep: true
  },
  methods: {
    onSubmit() {
      this.$refs.form.validate(valid => {
        if (!valid) {
          return;
        }
        this.$emit("submit", this.valueForSubmit);
      });
    },
    cancel() {
      this.$emit("cancel");
    }
  }
};
</script>

<style lang='less' scoped>
.booking-form {
  position: relative;
  display: block;

  .btn-wrapper {
    text-align: right;
  }
  .tag-block {
    float: left;
  }
}
</style>
