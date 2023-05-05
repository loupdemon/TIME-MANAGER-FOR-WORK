<template>

  <tr class="hover:bg-gray-50 hover:shadow-md ease-linear transition-all rounded-lg py-5 px-3 shadow-sm">
   <div class="employee_array__content">
    <td class="flex flex-row items-center ">
      <img class="object-cover w-10 h-10 rounded-full mx-2" :src="`${ employee.photo ? employee.photo : 'https://st3.depositphotos.com/4111759/13425/v/380/depositphotos_134255626-stock-illustration-avatar-male-profile-gray-person.jpg'}`" alt="Profile image"/>
      <div class="employees__name">
        <span class="font-bold text-gray-700 text-sm">{{ employee.username }}</span>
        <span class="text-gray-500 text-xs">{{ employee.email }}</span>
      </div>
    </td>

    <td>
      <div class="flex flex-col">
        <span class="font-semibold text-sm text-center">{{ employee.job }}</span>
        <span class="text-center text-xs text-gray-500">{{ employee.role }}</span>
      </div>
    </td>

    <td>
      <div class="flex flex-col mx-5">
        <span class="text-xs text-gray-500 text-center">Currently assigned to:</span>
        <span class="text-center font-semibold text-sm"> Unassigned </span>
      </div>
    </td>
   <div class="employee_array__content">
    <td class="sidebar__link">
      <router-link v-if="this.$store.state.user.id === this.employee.id || this.$store.state.user.role === 'Manager' || this.$store.state.user.role === 'General Manager'" :to="`/profile/${employee.id}`"><img src="https://img.icons8.com/external-sbts2018-blue-sbts2018/50/26e07f/external-profile-social-media-basic-1-sbts2018-blue-sbts2018.png"/></router-link>
    </td>

    <td class="sidebar__link">
      <router-link v-if="this.$store.state.user.id === this.employee.id || this.$store.state.user.role === 'Manager' || this.$store.state.user.role === 'General Manager'" :to="`/attendance/${employee.id}`" ><img src="https://img.icons8.com/color/50/000000/attendance-mark.png"/></router-link>
    </td>

    <td class="sidebar__link">
      <router-link v-if="this.$store.state.user.id === this.employee.id || this.$store.state.user.role === 'Manager' || this.$store.state.user.role === 'General Manager'" :to="`/schedule/${employee.id}`"><img src="https://img.icons8.com/ios-filled/50/26e07f/overtime.png"/></router-link>
    </td>

    <td class="sidebar__link">
      <button v-if="this.$store.state.user.role === 'Manager' || this.$store.state.user.role === 'General Manager'" @click="deleteUser"><img src="https://img.icons8.com/color/50/000000/full-trash.png"/></button>
    </td>
   </div>
   </div>

  </tr>


</template>

<script>
import Api from "../../api";

export default {
  name: "EmployeesCard",
  props: {
    employee: {}
  },
  mounted() {
    this.user_id = this.employee.id
  },
  data() {
    return {
      user_id: ''
    }
  },
  methods: {
    async deleteUser() {
      await Api.deleteUser(this.user_id)
      // this.$snackbar.add({
      //   text: `The employee ${this.employee.username} was deleted.`,
      //   type: 'success'
      // })
      this.$router.go()
    }
  }
}
</script>

<style scoped>
tr {
  border-spacing: 0 15px;
}

</style>