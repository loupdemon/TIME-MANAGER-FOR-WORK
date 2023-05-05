<template>
  <div class="flex items-center">
    <button class="app-button bg-yellow-500 text-white text-sm hover:bg-yellow-600">
      <Modal @save="updateTeam">
        <template v-slot:buttonName>Modify</template>
        <template v-slot:title>
          <span class="font-semibold">Modify this team</span>
        </template>
        <template v-slot:body>
          <form>
            <div class="mb-3">
              <span id="messageStatus">Team name:</span>
              <input type="text" class="form-control px-2" v-model="this.newTeamName" placeholder="Team name" id="teamName"/>
            </div>
          </form>
        </template>
        <template v-slot:button>Modify</template>
      </Modal>
    </button>
  </div>
</template>

<script>
import Modal from "../Modal/Modal.vue";
import Api from "../../api";

export default {
  name: "ModifyTeam",
  components: {
    Modal
  },
  data() {
    return {
      newTeamName: ""
    }
  },
  methods: {
    async updateTeam() {
      const payload = { name: this.newTeamName }
      const res = await Api.updateTeam(this.$route.params.id, payload)
      console.log(res)
      this.$router.go()
    }
  }
}
</script>

<style scoped>

</style>