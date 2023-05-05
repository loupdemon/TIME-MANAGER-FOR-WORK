<script>
import Navbar from './components/Navbar/Navbar.vue'
import Authentication from './components/Authentication.vue'
export default {
  name: 'App',
  components: {
    Navbar,
    Authentication
  },
  mounted() {
    console.log(localStorage.getItem('token'))
    if (localStorage && JSON.parse(localStorage.getItem("user"))){
      this.$store.state.user.id = JSON.parse(localStorage.getItem("user")).id
      this.$store.state.user.role = JSON.parse(localStorage.getItem("user")).role
      this.token = JSON.parse(localStorage.getItem("user")).token
    }
    console.log(this.$store.state.user)
  },
  data() {
    return {
      token: null
    }
  }
}
</script>

<template>
  <Authentication v-if="!token"/>
  <div v-else class="grid-container">
    <Navbar class="nav-header"/>
     <main class="pt-16 lg:pl-64 bg-gray-200">
      <div class="p-2">

        <div  class="mt-4 p-2 bg-white rounded shadow font-semibold hover:shadow-md">
          <router-view class="nav-main"/>
        </div>
      </div>
    </main>
  </div>
</template>
<style>
.nav-header { grid-area: header; }
</style>