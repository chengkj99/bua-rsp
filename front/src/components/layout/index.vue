<template>
  <div class="container">
    <app-head></app-head>
    <app-content></app-content>
    <app-footer></app-footer>
  </div>
</template>

<script>
import AppHead from './app-head'
import AppContent from './app-content'
import AppFooter from './app-footer'
export default {
  name: 'container',
  components: {
    AppHead,
    AppContent,
    AppFooter
  },
  data() {
    return {}
  },
  methods: {
  }
}
</script>

<style lang='less' scoped>
.container {
  position: relative;
  display: block;
}
</style>
