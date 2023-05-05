<template>
  <div class="flex flex-col mb-3 justify-center">
    <span class="mb-2">Search an employee by name and/or email:</span>
    <div class="employee_search__content">
      <div>
        <span class="mr-2">Name:</span>
        <input v-model="search.username" class="text-sm border border-gray-500 rounded-md px-2 py-1 mr-3 hover:border-blue-600" type="text" placeholder="Username..." />
      </div>
      <div>
        <span class="mr-2">Email:</span>
        <input v-model="search.email" class="text-sm border border-gray-500 rounded-md px-2 py-1 mr-3 hover:border-blue-600" type="email" placeholder="Email..." />
      </div>

      <button @click="searchUser" class="app-button text-white text-sm bg-blue-500 hover:bg-blue-800">Search</button>
    </div>
  </div>
</template>

<script>
export default {
  name: "EmployeeSearchBar",
  data() {
    return {
      search: {
        username: '',
        email: ''
      }
    }
  },
  methods: {
    async searchUser() {
      console.log(this.search)
    }
  }
}
</script>

<style scoped>

</style>