<template>

  <div class="user__worked__hours__container">
    <span class="font-semibold mr-1">This week</span>
    <router-link :to="`/schedule/${this.$route.params.id ? this.$route.params.id : ''}`" class="app-button text-xs bg-blue-500 text-white hover:bg-blue-800">More</router-link>
    <table class="mt-3 px-3">
      <tbody>
        <tr>
          <td class="text-sm pr-3">Monday</td>
          <td class="text-sm">8:00:00 to 17:00:00</td>
          <td><button class="app-button text-xs text-yellow-500 hover:bg-yellow-100">Change</button></td>
        </tr>
        <tr>
          <td class="text-sm pr-3">Tuesday</td>
          <td class="text-sm">8:00:00 to 17:00:00</td>
          <td><button class="app-button text-xs text-yellow-500 hover:bg-yellow-100">Change</button></td>
        </tr>
        <tr>
          <td class="text-sm pr-3">Wednesday</td>
          <td class="text-sm">8:00:00 to 17:00:00</td>
          <td><button class="app-button text-xs text-yellow-500 hover:bg-yellow-100">Change</button></td>
        </tr>
        <tr>
          <td class="text-sm pr-3">Thursday</td>
          <td class="text-sm">8:00:00 to 17:00:00</td>
          <td><button class="app-button text-xs text-yellow-500 hover:bg-yellow-100">Change</button></td>
        </tr>
        <tr>
          <td class="text-sm pr-3">Friday</td>
          <td class="text-sm">8:00:00 to 17:00:00</td>
          <td><button class="app-button text-xs text-yellow-500 hover:bg-yellow-100">Change</button></td>
        </tr>
      </tbody>
    </table>
  </div>

</template>

<script>
export default {
  name: "UserWorkedHours"
}
</script>

<style scoped>

</style>