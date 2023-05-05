<template>

  <table class="table min-w-full" v-if="!areEmployeesLoading">
    <tbody>
      <EmployeesCard
      v-for="employee in employees"
      :key="employee.id"
      :employee="employee"
      />
    </tbody>
  </table>

  <loading v-else :active="areEmployeesLoading"
           :can-cancel="false"
           :is-full-page="false"/>
</template>

<script>
import EmployeesCard from './EmployeesCard.vue'
import Api from '../../api'
import Loading from 'vue-loading-overlay';
import 'vue-loading-overlay/dist/vue-loading.css';
export default {
  name: "EmployeesList",
  components: {
    EmployeesCard,
    Loading
  },
  async mounted() {
    this.employees = await Api.getAllUsers()
    this.areEmployeesLoading = false
  },
  data() {
    return {
      employees: [],
      areEmployeesLoading: true
    }
  },
}
</script>

<style scoped>
table {
  border-collapse:separate;
  border-spacing:0 15px;
}

</style>