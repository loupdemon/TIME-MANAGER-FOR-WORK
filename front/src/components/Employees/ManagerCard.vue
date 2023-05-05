<template>
  <div class="flex flex-row justify-center items-center mt-2 mb-5">
    <img class="object-cover w-24 h-24 rounded-full mr-3" :src="this.managerInfos.photo" alt="Profile image"/>
    <div class="flex flex-col">
      <span class="font-bold text-sm">{{ this.managerInfos.username }}</span>
      <span class="text-sm text-gray-400">{{ this.managerInfos.email }}</span>
    </div>
  </div>
  <div class="flex flex-col justify-center items-center" v-if="this.$store.state.user.role === 'General Manager'">
    <button @click="showModifyManager" class="self-center app-button bg-yellow-500 text-white hover:bg-yellow-700 text-sm">Change manager</button>
    <div class="self-center mt-2" v-if="isModifyManager">
      <span class="mr-2">Manager:</span>
      <select v-model="teamManagerToSave" class="px-2 border border-gray-500 rounded-md">
        <option v-for="user in this.teamManagerList" :value="user"> {{ user.username }}</option>
      </select>
      <button @click="saveManager" class="app-button bg-blue-500 hover:bg-blue-600 text-white text-sm">SAVE</button>
    </div>
  </div>

</template>

<script>
import Api from "../../api";

export default {
  name: "ManagerCard",
  props: ["managerInfos"],
  async mounted() {
    this.teamManagerList = await Api.getUsersFromTeamId(this.$route.params.id)
    this.isTeamLoading = false;
  },
  methods: {
    showModifyManager() {
      this.isModifyManager = true;
    },
    async saveManager() {
      await Api.addTeamManager(this.$route.params.id, this.teamManagerToSave.id)
      this.$router.go()
    }
  },
  data() {
    return {
      teamManagerToSave: {},
      isModifyManager: false,
      teamManagerList: [],
    }
  }
}
</script>

<style scoped>

</style>