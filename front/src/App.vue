<template>
  <div id="app">
    <app-layout></app-layout>
  </div>
</template>

<script>
import AppLayout from '@/components/layout'
import axios from 'axios'
export default {
  name: 'App',
  components: {
    AppLayout
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
body {
  margin: 0;
  padding: 0;
}
</style>
