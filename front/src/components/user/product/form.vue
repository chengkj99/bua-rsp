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
      <el-form-item label="产品所属" prop="owner">
        <el-input v-model="form.owner" size="small" placeholder="请输入产品所属人"></el-input>
      </el-form-item>
      <el-form-item label="描述" prop="desc">
        <el-input v-model="form.desc" size="small" placeholder="请输入描述"></el-input>
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
      <el-form-item label="计费规则">
        <div class="price-wrapper">
          <span>按</span>
          <el-select class="price-input" v-model="form.priceType" size="small" placeholder="请选择">
            <el-option
              v-for="(desc, val) in priceTypeNameMap"
              :key="val"
              :label="desc"
              :value="val">
            </el-option>
          </el-select>
          <span class="desc">收费，每{{priceTypeNameMap[form.priceType]}}</span>
          <el-input class="price-input" v-model="form.priceValue" size="small" placeholder="请输入价格"></el-input>
          <span>元</span>
        </div>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button size="small" @click="cancel">取 消</el-button>
      <el-button type="primary" size="small" @click="submit">确 定</el-button>
    </div>
  </div>
</template>

<script>
import { priceTypes, priceTypeNameMap } from "@/constants/product"
export default {
  name: "product-form",
  props: ["value"],
  data() {
    return {
      priceTypes,
      priceTypeNameMap,
      form: {
        name: "",
        originalPrice: "",
        firmModel: "",
        parameter: "",
        functionalUse: "",
        contacts: "",
        phone: "",
        mail: "",
        imgUrl: "",
        owner: "",
        desc: "",
        priceType: "",
        priceValue: ""
      },
      rules: {
        name: [
          {
            type: "string",
            required: true,
            message: "请输入产品名称",
            trigger: "blur"
          }
        ],
        originalPrice: [
          {
            type: "string",
            required: true,
            message: "请输入产品原价值",
            trigger: "blur"
          }
        ],
        firmModel: [
          {
            type: "string",
            required: true,
            message: "请输入厂商型号",
            trigger: "blur"
          }
        ],
        parameter: [
          {
            type: "string",
            required: true,
            message: "请输入性能参数",
            trigger: "blur"
          }
        ],
        functionalUse: [
          {
            type: "string",
            required: true,
            message: "请输入功能用途",
            trigger: "blur"
          }
        ],
        contacts: [
          {
            type: "string",
            required: true,
            message: "请输入联系人",
            trigger: "blur"
          }
        ],
        phone: [
          {
            type: "string",
            required: true,
            message: "请输入联系人电话",
            trigger: "blur"
          }
        ],
        mail: [
          {
            type: "string",
            required: true,
            message: "请输入联系人邮箱",
            trigger: "blur"
          }
        ],
        owner: [
          {
            type: "string",
            required: true,
            message: "请输入产品所属人",
            trigger: "blur"
          }
        ],
        desc: [
          {
            type: "string",
            required: true,
            message: "请输入描述",
            trigger: "blur"
          }
        ]
      }
    };
  },
  methods: {
    cancel() {
      this.$emit("cancel");
    },
    submit() {
      this.$refs.ruleForm.validate(valid => {
        valid && this.$emit("submit", this.form);
      });
    }
  }
};
</script>

<style lang='less' scoped>
.product-form {
  position: relative;
  display: block;

  .price-wrapper {
    display: flex;
    flex-flow: nowrap row;
    justify-content: flex-start;
    > span {
      display: inline-block;
      .desc {
        width: 100px;
      }
    }
    .price-input {
      width: 120px;
      margin: 0 6px 0 6px;
    }
  }

  .dialog-footer {
    text-align: right;
  }
}
</style>
