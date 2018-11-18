<template>
  <div class="user-login">
    <el-form class="login-form" label-position="left" label-width="50px" :model="form">
       <h3>登录系统</h3>
      <el-form-item label="账号">
        <el-input v-model="form.name" size="small" placeholder="请输入账号名称"></el-input>
      </el-form-item>
      <el-form-item label="密码">
        <el-input v-model="form.password" size="small" placeholder="请输入密码" type="password"></el-input>
      </el-form-item>
      <el-form-item align="left">
        <el-button size="small" type="primary" @click="onLogin" style="width: 100%;" @keyup.enter="onLogin">登 录</el-button>
      </el-form-item>
     <el-form-item align="right">
       没有账号?  <a class="register" href="javascript:void(0)">现在注册</a>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import {login} from '@/apis/user'
export default {
  name: "user-login",
  data() {
    return {
      form: {
        name: "",
        password: ""
      }
    }
  },
  methods: {
    onLogin() {
      login(this.form).then(
        res => {
          window.location.href = '/'
         },
        err => {
          this.$message({
            type: 'warning',
            message: '登录失败'
          })
        }
      )
    }
  }
};
</script>

<style lang='less' scoped>
.user-login {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 800px;
  .login-form {
    width: 300px;
    margin-top: 20%;
    margin-bottom: 20%;

    > h3 {
      text-align: left;
    }

    .register {
      text-decoration: none;
    }
  }
}
</style>
