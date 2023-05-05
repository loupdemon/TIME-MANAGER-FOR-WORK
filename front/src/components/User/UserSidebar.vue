<template>
  <div class="userSidebar__container">
    <img class="object-cover w-10 h-10 rounded-full" :src="currentUser.photo" alt="Profile image"/>
    <span class="userSidebar__greetings">Hello, <strong>{{ currentUser.username }}!</strong></span>
    <button class="userSidebar__logout">Logout</button>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: "UserSidebar",
  mounted() {
    this.getCurrentUser()
  },
  methods: {
    async getCurrentUser() {
      axios.get(`http://localhost:4000/api/users/${this.$store.state.user.id}`)
      .catch(e => console.log(e))
      .then(result => this.currentUser = result.data.data)
    }
  },
  data() {
    return {
      currentUser: {}
    }
  }
}
</script>

<style scoped>

</style>