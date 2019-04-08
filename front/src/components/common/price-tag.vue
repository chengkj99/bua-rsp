<template>
  <span v-if="priceValue">
    每{{priceTypeNameMap[priceType]}} {{priceValue}}元
    <el-tag :type="priceStyle[priceType]" size="mini">
      {{priceTypeNameMap[priceType]}}
    </el-tag>
  </span>
  <span v-else>无</span>
</template>

<script>
import { priceTypeNameMap, priceStyle } from '@/constants/product'

export default {
  name: "price-tag",
  props: ['priceType', 'priceValue'],
  data() {
    return {
      priceStyle,
      priceTypeNameMap
    }
  }
}
</script>

<style lang='less' scoped>
</style>
