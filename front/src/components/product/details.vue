<template>
  <div class="product-details">
    <el-form :model="value" label-width="120px" align="left">
      <el-form-item class="img-block">
        <span>
          <img :src="`${imgDomainName}/${value.img_url}`" alt="仪器图片">
        </span>
      </el-form-item>
      <el-form-item label="名称：" class="special-block">
        <span>{{value.name}}</span>
      </el-form-item>
      <el-form-item label="原价：" class="special-block">
        <span>{{value.original_price}}</span>
      </el-form-item>
      <el-form-item label="厂商及型号：" class="special-block">
        <span>{{value.firm_model}}</span>
      </el-form-item>
      <el-form-item label="主要性能参数：">
        <span>{{value.parameter}}</span>
      </el-form-item>
      <el-form-item label="功能用途：">
        <span>{{value.functional_use}}</span>
      </el-form-item>
      <el-form-item label="联系人：">
        <span>{{value.contacts || '-'}}</span>
      </el-form-item>
      <el-form-item label="联系电话：">
        <span>{{value.phone || '-'}}</span>
      </el-form-item>
      <el-form-item label="邮箱：">
        <span>{{value.mail || '-'}}</span>
      </el-form-item>
      <el-form-item label="状态：">
        <el-tag :type="statusesStyle[value.status]">
          {{ statusNameMap[value.status] }}
        </el-tag>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import { statusNameMap, statusesStyle, imgDomainName} from '@/constants/product'

export default {
  name: 'product-details',
  props: ['value'],
  data() {
    return {
      statusNameMap,
      statusesStyle,
      imgDomainName
    }
  }
}
</script>

<style lang='less' scoped>
.product-details {
  position: relative;
  display: block;

  .img-block {
    position: absolute;
    right: 10px;
    top: 0;

    img {
      width: 160px;
      height: 160px;
      border: 1px solid #ccc;
    }
  }

  .special-block {
    width: 400px;
  }
}
</style>
