<template>
  <div class="userprofile__container">
    <div class="userprofile__current">
      <img class="userprofile__avatar" :src="user.photo" alt="avatar" />

      <div class="userprofile__curent__right">
        <div class="userprofile__field">
          <span class="font-semibold text-lg">{{ user.username }}</span>
        </div>
        <div class="userprofile__field">
          <span class="text-xs text-gray-500 mb-3">{{ user.email }}</span>
        </div>
        <div class="userprofile__field">
          <span class="font-semibold text-sm">Job : </span>
          <span class="text-xs font-semibold">{{ user.job }}</span>
        </div>
        <div class="userprofile__field">
          <span class="font-semibold text-sm">Team : </span>
          <span class="text-xs font-semibold">R&D</span>
        </div>
        <div class="mt-5">
          <span class="font-semibold text-sm">Role : </span>
          <span class="text-xs">{{ user.role }}</span>
        </div>

<!--        EDIT USERS BUTTON-->
        <button class="font-bold py-1 px-2 rounded ease-linear transition-all duration-150 bg-yellow-400 text-sm text-white hover:bg-yellow-600">
          <Modal @save="updateUser">
            <template v-slot:buttonName>Edit profile</template>
            <template v-slot:title>
              <span class="font-semibold">Edit my profile</span>
            </template>
            <template v-slot:body>
              <table>
                <tr>
                  <td class="flex flex-row items-center"> <span class="self-start mr-2">Username:</span> </td>
                  <td> <input v-model="this.payload.username" class="text-sm px-2 py-1 border border-gray-300 hover:border-blue-500 rounded-md" type="text" :placeholder="this.user.username" /> </td>
                </tr>

                <tr>
                  <td class="flex flex-row items-center"> <span class="self-start">Email:</span> </td>
                  <td> <input v-model="this.payload.email" class="text-sm px-2 py-1 border border-gray-300 hover:border-blue-500 rounded-md" type="text" :placeholder="this.user.email" /> </td>
                </tr>

                <tr>
                  <td class="flex flex-row items-center"> <span class="self-start">Job:</span> </td>
                  <td> <input v-model="this.payload.job" class="text-sm px-2 py-1 border border-gray-300 hover:border-blue-500 rounded-md" type="text" :placeholder="this.user.job" /> </td>
                </tr>

                <tr>
                  <td class="flex flex-row items-center"> <span class="self-start">Role:</span> </td>
                  <td>
                    <select v-model="this.payload.role"  class="border rounded-md border-gray-500 px-2 py-1">
                      <option
                          v-for="(role, index) in ['User', 'Team Manager', 'General Manager']"
                          :key="index"
                          :value="role">
                        {{ role }}
                      </option>
                    </select>
                  </td>
                </tr>
              </table>
            </template>
            <template v-slot:button>Yes</template>
          </Modal>
        </button>

<!--        DELETE BUTTON-->
        <button class="font-bold py-1 px-2 rounded ease-linear transition-all duration-150 bg-red-500 text-sm text-white hover:bg-red-600">
          <Modal @save="deleteUser">
            <template v-slot:buttonName>Delete account</template>
            <template v-slot:title>
              <span class="font-semibold">Delete user</span>
            </template>
            <template v-slot:body>
              <form>
                <div class="mb-3">
                  <label> Are you sure ? </label>
                </div>
              </form>
            </template>
            <template v-slot:button>Yes</template>
          </Modal>

        </button>
      </div>
    </div>
  </div>
  <!-- Modal -->
</template>

<script>
import Modal from "../Modal/Modal.vue";

import Api from '../../api'

export default {
  name: "UserProfile",
  data() {
    return {
      user: {
        id: undefined,
        username: undefined,
        email: undefined,
        role: undefined,
        photo: undefined,
        job: undefined,
      },
      show: false,
      payload: {
        username: undefined,
        email: undefined,
        role: undefined,
        job: undefined
      }
    };
  },
  components: {
    Modal,
  },
  props: {
    method: { type: Function },
  },
  async mounted() {
    if (this.$route.params.id) this.user = (await Api.getUser(this.$route.params.id)).data.data;
    else this.user = (await Api.getUser(this.$store.state.user.id)).data.data;
  },
  methods: {
    closeModal() {
      this.isModalVisible = false;
    },
    launchModal() {
      this.isModalVisible = true;
      //this.showModal = !this.showModal;
    },
    async updateUser() {
      this.show = !this.show;
      const updatePayload = Object.fromEntries(Object.entries(this.payload).filter(([_, v]) => v != null))
      const updatedUser = (await Api.updateUser(this.user.id, updatePayload)).data.data
      this.$store.state.user.role = updatedUser.role
      console.log(this.$store.state.user.role)
      this.$router.go()
    },
    async deleteUser() {
      await Api.deleteUser(this.user.id)
    }
  },
};
</script>

<style scoped>
table {
  border-collapse: separate;
  border-spacing: 0 0.5rem;
}
</style>