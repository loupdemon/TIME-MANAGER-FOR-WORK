<template>
  <div class="flex flex-col justify-between bg-gray-100 rounded-md p-5 hover:bg-gray-200 hover:shadow-md ease-in-out transition-all">

    <div class="flex flex-col">
      <span class="text-xl">{{ team.name }}</span>
      <span class="text-sm mb-2">Team Manager: {{ this.manager ? this.manager : 'Not Assigned'}}</span>
    </div>

    <div>
      <router-link class="mr-2 font-bold py-1 px-2 rounded ease-linear transition-all duration-150 text-sm text-blue-500 hover:text-white hover:bg-blue-500" :to="`/team/${team.id}`">See team</router-link>
      <button @click="removeTeam" class="mr-2 font-bold py-1 px-2 rounded ease-linear transition-all duration-150 text-sm text-red-500 hover:text-white hover:bg-red-500">Remove</button>
    </div>

  </div>

</template>

<script>
import Api from '../../api'
export default {
  name: "TeamCard",
  props: ["team"],
  async mounted() {
    this.manager = (await Api.getUser(this.team.manager)).data.data.username
  },
  methods: {
    async removeTeam() {
      await Api.deleteTeam(this.team.id)
      this.$router.go()
    }
  },
  data() {
    return {
      manager: ''
    }
  }
}
</script>

<style scoped>

</style>