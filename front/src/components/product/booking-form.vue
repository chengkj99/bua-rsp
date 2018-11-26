<template>
  <div class="booking-form">
    <el-form ref="form" :model="form" :rules="rules" label-width="80px" size="small">
      <el-form-item label="时间" prop="times">
        <el-date-picker
          v-model="form.times"
          style="width: 100%"
          type="daterange"
          range-separator="至"
          start-placeholder="开始日期"
          end-placeholder="结束日期">
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
  name: '',
  times: [new Date(), new Date()],
  reason: ''
}
const initialRules = {
  times: [{ required: true, message: '请输入预约时间段' }],
  reason: [{ required: true, message: '请输入备注信息' }]
}
export default {
  name: 'booking-form',
  data() {
    return {
      form: { ...initialForm },
      rules: initialRules
    }
  },
  computed: {
    valueForSubmit() {
      let { name, reason, times } = this.form
      let [startTime, endTime] = times
      return {
        reason,
        startTime,
        endTime
      }
    }
  },
  methods: {
    onSubmit() {
      this.$refs.form.validate(valid => {
        if (!valid) {
          return
        }
        this.$emit('submit', this.valueForSubmit)
      })
    },
    cancel() {
      this.$emit('cancel')
    }
  }
}
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
