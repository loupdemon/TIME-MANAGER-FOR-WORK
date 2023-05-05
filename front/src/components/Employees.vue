<template>

  <div v-if="this.$store.state.user.role === 'Manager' || this.$store.state.user.role === 'General Manager'" class="main__container">
    <div class="employees__all">
      <div class="flex flex-row">
        <h3 class="view-title">Employees</h3>
        <AddEmployee v-if="this.$store.state.user.role === 'Manager' || this.$store.state.user.role === 'General Manager'" />
      </div>
<!--      <EmployeeSearchBar />-->
      <EmployeesList />
    </div>

  </div>

  <Unauthorized v-else />
</template>

<script>
import EmployeesList from '../components/Employees/EmployeesList.vue'
import AddEmployee from "./Employees/AddEmployee.vue";
import Unauthorized from "./Errors/Unauthorized.vue"
import EmployeeSearchBar from "./Employees/EmployeeSearchBar";

export default {
  name: "Employees",
  components: {
    EmployeeSearchBar,
    EmployeesList,
    AddEmployee,
    Unauthorized
  }

}
</script>

<style scoped>

</style>