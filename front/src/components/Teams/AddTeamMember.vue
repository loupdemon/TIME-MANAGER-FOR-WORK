<template>
  <div class="flex items-center">
    <button
        class="app-button bg-green-500 text-white text-sm hover:bg-green-800"
    >
      <Modal @save="addTeamMember">
        <template v-slot:buttonName>+ Add</template>
        <template v-slot:title>
          <span class="font-semibold">Add a member to this team</span>
        </template>
        <template v-slot:body>
          <form>
              <span>Employee:</span>
              <select v-model="user">
                <option v-for="user in users" :value="user">{{ user.username }} </option>
              </select>
          </form>
        </template>
        <template v-slot:button>Add</template>
      </Modal>
    </button>
  </div>

  <teleport to="body">
    <vue3-snackbar bottom :duration="5000"/>
  </teleport>
</template>

<script>
import Modal from "../Modal/Modal.vue";
import Api from "../../api";
import Utils from '../../utils';

export default {
  name: "AddTeamMember",
  data() {
    return {
      users: [],
      user: {},
      team_id: ''
    }
  },
  components: {
    Modal,
  },
  async mounted() {
    this.team_id = this.$route.params.id
    const allUsers = await Api.getAllUsers()
    const allTeamUsers = await Api.getUsersFromTeamId(this.$route.params.id)
    this.users = Utils.getUsersNotAssignedInTeam(allUsers, allTeamUsers)
    this.user = this.users[0]
  },
  props: {
    method: { type: Function },
  },
  methods: {
    async addTeamMember() {
      await Api.addTeamMember(this.team_id, this.user.id)
      this.$snackbar.add({
        text: 'Member successfully added to the team',
        type: 'success'
      })
      this.$router.go()
    }
  }
};
</script>

<style scoped>
</style>