<template>
  <div class="booking-form">
    times: {{times}}
    <el-form ref="form" :model="form" :rules="rules" label-width="80px" size="small">
      <el-form-item label="时间" prop="times">
        <el-date-picker
          v-model="form.times"
          style="width: 100%"
          type="daterange"
          range-separator="至"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
          :picker-options="pickerOptions">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="备注" prop="reason">
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
const initialForm = {
  name: "",
  times: [],
  reason: ""
};
const initialRules = {
  times: [{ required: true, message: "请输入预约时间段" }],
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
  props: ["times"],
  data() {
    return {
      form: { ...initialForm },
      rules: initialRules,
      pickerOptions: {}
    };
  },
  computed: {
    valueForSubmit() {
      let { name, reason, times } = this.form;
      let [startTime, endTime] = times;
      return {
        reason,
        startTime: resetTargetSecondTime(startTime, 0, 0, 0, 0),
        endTime: resetTargetSecondTime(endTime, 23, 59, 59, 59)
      };
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
}
</style>
