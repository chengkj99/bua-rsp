<template>
  <div class="user-register">
    <div class="tabs-wrapper">
      <el-tabs v-model="type" type="card" @tab-click="handleClick">
        <el-tab-pane label="普通用户注册" :name="userTypes.user">
          <register-form @register="handleRegister"></register-form>
        </el-tab-pane>
        <el-tab-pane label="管理员用户注册" :name="userTypes.publisher">
          <div class="content-wrapper">
            请联系 400-6600-866 申请注册
          </div>
        </el-tab-pane>
      </el-tabs>
    </div>
  </div>
</template>

<script>
import { userTypes } from "@/constants/user";
import { registerUser, loginUser } from "@/apis/user";
import RegisterForm from "./form";
export default {
  name: "user-register",
  data() {
    return {
      userTypes,
      type: userTypes.user
    };
  },
  components: {
    RegisterForm
  },
  fromMobx: {},
  methods: {
    handleClick(e) {
      console.log("!!!", e);
    },
    handleRegister(value) {
      registerUser(value).then(
        res => {
          this.$message.success("注册成功");
          loginUser(value).then(
            res => {
              window.location.href = "/";
            },
            res => {
              window.location.href = "/";
            }
          )
        },
        err => {
          this.$message.error(`注册失败${err}`);
        }
      )
    }
  }
};
</script>

<style lang='less' scoped>
.user-register {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 800px;

  .tabs-wrapper {
    width: 50%;
    min-width: 300px;
    height: 560px;
  }
  .content-wrapper {
    margin-top: 25%;
  }
}
</style>
