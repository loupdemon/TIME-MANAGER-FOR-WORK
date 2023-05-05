<template>
  <div class="flex items-center">
    <button
        class="app-button bg-green-500 text-white text-sm hover:bg-green-800"
    >
      <Modal @save="createTeam">
        <template v-slot:buttonName>+ Add</template>
        <template v-slot:title>
          <span class="font-semibold">Add a team</span>
        </template>
        <template v-slot:body>
          <form>
            <div class="mb-3">
              <span id="messageStatus">Team name:</span>
              <input type="text" class="form-control" v-model="teamName" placeholder="Team name" id="teamName"/>
            </div>
            <div class="mb-3">
              <span>Team Manager:</span>
              <select v-model="user">
                <option v-for="user in users" :value="user">{{ user.username }} </option>
              </select>
            </div>
          </form>
        </template>
        <template v-slot:button>Add</template>
      </Modal>
    </button>
  </div>
</template>

<script>
import Modal from "../Modal/Modal.vue";
import Api from "../../api";

export default {
  name: "AddTeam",
  data() {
    return {
      users: [],
      user: {}
    }
  },
  components: {
    Modal,
  },
  async mounted() {
    this.users = (await Api.getAllUsers()).filter(user => user.role === "Team Manager" || user.role === "Manager");
    this.user = this.users[0]
  },
  props: {
    method: { type: Function },
  },
  methods: {
    async createTeam() {
      const payload = { name: this.teamName, manager_team_id: this.user?.id || null };
      const res = await Api.createTeam(payload)
      console.log(res)
    }
  }
};
</script>

<style scoped>
</style>