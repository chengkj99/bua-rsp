<template>
  <div class="product-form">
    <el-form :model="form" :rules="rules" ref="ruleForm" label-width="100px" class="form-block">
      <el-form-item label="产品名称" prop="name">
        <el-input v-model="form.name" size="small" placeholder="请输入产品名称"></el-input>
      </el-form-item>
      <el-form-item label="原价值" prop="originalPrice">
        <el-input v-model="form.originalPrice" type="number" size="small" placeholder="请输入产品原价值">
          <template slot="append">万元</template>
        </el-input>
      </el-form-item>
      <el-form-item label="厂商型号" prop="firmModel">
        <el-input v-model="form.firmModel" size="small" placeholder="请输入厂商型号"></el-input>
      </el-form-item>
      <el-form-item label="性能参数" prop="parameter">
        <el-input v-model="form.parameter" size="small" placeholder="请输入性能参数"></el-input>
      </el-form-item>
      <el-form-item label="功能用途" prop="functionalUse">
        <el-input v-model="form.functionalUse" size="small" placeholder="请输入功能用途"></el-input>
      </el-form-item>
      <el-form-item label="联系人" prop="contacts">
        <el-input v-model="form.contacts" size="small" placeholder="请输入联系人"></el-input>
      </el-form-item>
      <el-form-item label="联系人电话" prop="contacts">
        <el-input v-model="form.phone" size="small" placeholder="请输入联系人电话"></el-input>
      </el-form-item>
      <el-form-item label="邮箱" prop="contacts">
        <el-input v-model="form.mail" size="small" placeholder="请输入联系人邮箱"></el-input>
      </el-form-item>
      <el-form-item label="产品所属" prop="owner">
        <el-input v-model="form.owner" size="small" placeholder="请输入产品所属人"></el-input>
      </el-form-item>
      <el-form-item label="描述" prop="desc">
        <el-input v-model="form.desc" size="small" placeholder="请输入描述"></el-input>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button size="small" @click="cancel">取 消</el-button>
      <el-button type="primary" size="small" @click="submit">确 定</el-button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'product-form',
  props: ['value'],
  data() {
    return {
      form: {
        name: '',
        originalPrice: '',
        firmModel: '',
        parameter: '',
        functionalUse: '',
        contacts: '',
        phone: '',
        mail: '',
        imgUrl: '',
        owner: '',
        desc: ''
      },
      rules: {
        name: [
          { type: 'string', required: true, message: '请输入产品名称', trigger: 'blur' }
        ],
        originalPrice: [
          { type: 'string', required: true, message: '请输入产品原价值', trigger: 'blur' }
        ],
        firmModel: [
          { type: 'string', required: true, message: '请输入厂商型号', trigger: 'blur' }
        ],
        parameter: [
          { type: 'string', required: true, message: '请输入性能参数', trigger: 'blur' }
        ],
        functionalUse: [
          { type: 'string', required: true, message: '请输入功能用途', trigger: 'blur' }
        ],
        contacts: [
          { type: 'string', required: true, message: '请输入联系人', trigger: 'blur' }
        ],
        phone: [
          { type: 'string', required: true, message: '请输入联系人电话', trigger: 'blur' }
        ],
        mail: [
          { type: 'string', required: true, message: '请输入联系人邮箱', trigger: 'blur' }
        ],
        owner: [
          { type: 'string', required: true, message: '请输入产品所属人', trigger: 'blur' }
        ],
        desc: [
          { type: 'string', required: true, message: '请输入描述', trigger: 'blur' }
        ]
    }
    }
  },
  methods: {
    cancel() {
      this.$emit('cancel')
    },
    submit() {
      this.$refs.ruleForm.validate(valid => {
        valid && this.$emit('submit', this.form)
      })
    }
  }
}
</script>

<style lang='less' scoped>
.product-form {
  position: relative;
  display: block;

  .dialog-footer {
    text-align: right;
  }
}
</style>
