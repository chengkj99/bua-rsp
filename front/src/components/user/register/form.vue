<template>
  <el-form :model="form" status-icon :rules="rules" ref="form" label-width="100px" class="register-form" size="small">
    <el-form-item label="用户名" prop="name">
      <el-input placeholder="请输入用户名" v-model.trim="form.name" autocomplete="off"></el-input>
    </el-form-item>
    <el-form-item label="密码" prop="password">
      <el-input type="password" placeholder="请输入密码" v-model.trim="form.password" autocomplete="off"></el-input>
    </el-form-item>
    <el-form-item label="确认密码" prop="checkPass">
      <el-input type="password" placeholder="请确认密码" v-model.trim="form.checkPass" autocomplete="off"></el-input>
    </el-form-item>
    <!-- <el-form-item label="手机号" prop="phone">
      <el-input v-model.number="form.phone" placeholder="请确认手机号"></el-input>
    </el-form-item>
    <el-form-item label="手机验证码" prop="checkPhone">
      <el-input v-model.number="form.checkPhone" class="checkPhone-input"></el-input>
      <el-button type="primary" @click="sendCheckCode" class="checkPhone-button">发送验证码</el-button>
    </el-form-item> -->
    <el-form-item>
      <el-button class="submit-button" type="primary" @click="submitForm('form')">立即注册</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
export default {
  name: "register-form",
  data() {
    return {
      form: {
        name: "",
        password: "",
        checkPass: ""
        // phone: "",
        // checkPhone: ""
      },
      rules: {
        name: [
          {
            type: "string",
            required: true,
            message: "请输入用户名",
            trigger: "blur"
          }
        ],
        password: [
          {
            type: "string",
            required: true,
            message: "请输入密码",
            trigger: "blur"
          }
        ],
        checkPass: [
          {
            type: "string",
            required: true,
            message: "请再次输入密码",
            trigger: "blur"
          }
        ]
      }
    };
  },
  fromMobx: {},
  methods: {
    submitForm() {
      this.$refs.form.validate(valid => {
        if (!valid) {
          return false;
        }
        if (this.form.password !== this.form.checkPass) {
          this.$message({
            message: "密码不一致，请重新输入",
            type: "warning"
          });
          return;
        }
        this.$emit("register", this.form);
      });
    }
    // sendCheckCode() {}
  }
};
</script>

<style lang='less' scoped>
.register-form {
  position: relative;
  display: block;
  width: 80%;
  margin-top: 22px;
  .submit-button {
    width: 100%;
    margin-top: 20px;
  }

  .checkPhone-input {
    width: 49%;
    float: left;
  }
  .checkPhone-button {
    width: 49%;
    float: right;
  }
}
</style>
