<template>
  <div class="product-form">
    <el-form :model="form" label-width="100px" class="form-block">
     <el-form-item label="产品名称">
       <div class="name-block">{{form.name}}</div>
     </el-form-item>
     <el-form-item label="计费规则">
        <div class="price-wrapper">
          <span>按</span>
          <el-select class="price-input" v-model.trim="form.priceType" size="small" placeholder="请选择">
            <el-option
              v-for="(desc, val) in priceTypeNameMap"
              :key="val"
              :label="desc"
              :value="val">
            </el-option>
          </el-select>
          <span class="desc">计费，每{{priceTypeNameMap[form.priceType]}}</span>
          <el-input class="price-input" v-model.trim="form.priceValue" size="small" placeholder="请输入价格" type="number"></el-input>
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
import { priceTypeNameMap } from '@/constants/product'
export default {
  name: 'product-form',
  props: ['value'],
  data() {
    return {
      priceTypeNameMap,
      form: {
        name: '',
        priceType: '',
        priceValue: ''
      },
    }
  },
  watch: {
    value: {
      handler() {
        this.form.name = this.value.name
        this.form.priceType = this.value.price_type
        this.form.priceValue = this.value.price_value
      },
      deep: true,
      immediate: true
    }
  },
  methods: {
    cancel() {
      this.$emit('cancel')
    },
    submit() {
      if (!this.form.priceType) {
        this.$message.warning('请选择价格类型')
        return
      }
      if (!this.form.priceValue) {
        this.$message.warning('请输入价格')
        return
      }
      this.$emit('submit', {...this.value, ...this.form })
    }
  }
}
</script>

<style lang='less' scoped>
.product-form {
  position: relative;
  display: block;

  .name-block, .price-wrapper {
    text-align: left;
  }
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
