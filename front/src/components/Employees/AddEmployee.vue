<template>
  <div class="flex items-center">
    <button
      class="app-button bg-green-500 text-white text-sm hover:bg-green-800"
    >
      <Modal @save="createUser">
        <template v-slot:buttonName>+ Add</template>
        <template v-slot:title>
          <span class="font-semibold">Add employee</span>
        </template>
        <template v-slot:body>
          <form>
            <div class="mb-3">
              <span id="messageStatus"></span>
              <input
                type="username"
                class="form-control"
                v-model="username"
                placeholder="Username"
                id="Username"
              />
            </div>
            <div class="mb-3">
              <input
                type="email"
                class="form-control text-sm px-3"
                v-model="email"
                placeholder="Email ex : XX@XX.fr"
                aria-describedby="emailHelp"
                required
              />
            </div>
            <div class="mb-3">
              <input
                type="password"
                class="form-control"
                v-model="password"
                placeholder="Password"
                id="Password"
              />
            </div>
            <div class="mb-3">
              <input
                type="password"
                class="form-control"
                v-model="confirmPassword"
                placeholder="Confirm password"
                id="ConfirmPassword"
              />
              <br />
              <span
                v-if="this.password !== this.confirmPassword"
                id="message"
                class="font-bold text-red"
              >
                Not matching
              </span>
            </div>
            <div class="mb-3">
              <input
                class="form-control"
                v-model="job"
                placeholder="Job"
                id="Job"
              />
            </div>

            <div><input type="file" id="Photo" /><br /><br /></div>
            <div>
              <table>
                <thead>
                  <tr>
                    <th>Role for user</th>
                    <th>Team for user</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>
                      <select v-model="this.payload.role" id="role">
                        <option
                          v-for="item in roleList"
                          :value="item"
                          :key="item.name"
                        >
                          {{ item.name }}
                        </option>
                      </select>
                    </td>
                    <td>
                      <select v-model="this.payload.team" id="team">
                        <option
                          v-for="item in teams"
                          :value="item"
                          :key="item.id"
                        >
                          {{ item.name }}
                        </option>
                      </select>
                    </td>
                  </tr>
                </tbody>
              </table>
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
  name: "AddEmployee",
  data() {
    return {
      user: {
        id: undefined,
        username: undefined,
        email: undefined,
        password: undefined,
        confirmPassword: undefined,
        role: undefined,
        photo: undefined,
        job: undefined,
      },
      roleList: [
        { name: "User" },
        { name: "Team manager" },
        { name: "General manager" },
      ],
      teams: [],
      payload:{
        role: undefined,
        team: undefined,
      }
    };
  },
  components: {
    Modal,
  },
  async mounted() {
    this.teams = await Api.getAllTeams();
  },
  props: {
    method: { type: Function },
  },
  methods: {
    async createUser() {
      //this.show = !this.show;
      if (this.password === this.confirmPassword) {
        const response = await Api.createUser({
          username: this.username,
          email: this.email,
          password: this.password,
          job: this.job,
          role: this.role,
        }).catch(function (error) {
          if (error.response) {
            console.log(error.response.data);
            console.log(error.response.status);
            console.log(error.response.headers);
            document.getElementById("messageStatus").style.color = "red";
            document.getElementById("messageStatus").innerHTML =
              "Please retry, Error : " + error.response.status;
          } else {
            this.$router.go();
          }
        });
      }
      this.$router.go();
    },
  },
};
</script>

<style scoped>
</style>