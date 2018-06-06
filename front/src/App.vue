<template>
  <div id="app">
    <img src="./assets/logo.png">
    data: {{data}}
    <router-view/>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  name: 'App',
  data () {
    return {
      data: []
    }
  },
  beforeCreate () {
    axios.get('/api/product/getList').then(
      res => {
        this.data = res.data
      }
    )
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
  margin-top: 60px;
}
</style>
