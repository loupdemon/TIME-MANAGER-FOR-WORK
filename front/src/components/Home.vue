<template>
  <div class="main__container">
    <div class="flex flex-col items-center mb-5">
      <h3 class="view-title">Overview</h3>
<!--      <router-link to="/agenda" class="app-button text-sm bg-blue-500 text-white hover:bg-blue-800">Regarder le planning</router-link>-->
      <span>Welcome to your dashboard. Here you can have a quick look at your statistics for the past month.</span>
    </div>

    <LatestAttendance />

<!--    TODO: Add a real time clock-->
<!--    TODO: Add the clocking component-->

<!--    USER CHART MANAGER COMPONENT -->
      <div class="column">
        
        <div class="mycardChart">
          <span class="text-2xl font-bold mt-3"> My statistics this month </span>
          <div class="home__chart__container">
            <div class=" center py-8 lg:px-2">
                    <div  class=" p-11 bg-white rounded shadow font-semibold text-center hover:shadow-md">
                      <UserMonthlyBarChart />
                    </div>            
                    </div>
            <div class=" center py-8 lg:px-2">            
                    <div  class=" p-11 bg-white rounded shadow font-semibold text-center hover:shadow-md">
                      <UserOvertimeLineChart />
                    </div>
           </div>
            <div class=" center py-8 lg:px-2">
              <div  class=" p-11 bg-white rounded shadow font-semibold text-center hover:shadow-md">
                <UserPieChart />
              </div>
            </div>
          </div>
        </div>
      </div>


<!--    TEAM CHART MANAGER COMPONENT -->
     <div class="column">
        
<!--        <div class="mycardChart">-->
<!--          <span class="text-2xl font-bold mt-5"> My team's overview </span>-->

<!--          <div class="profile__user__content">-->
<!--&lt;!&ndash;              <div class=" center py-8 lg:px-2">  &ndash;&gt;-->
<!--&lt;!&ndash;                <div  class=" p-11 bg-white rounded shadow font-semibold text-center hover:shadow-md">&ndash;&gt;-->
<!--&lt;!&ndash;                  <GroupedWeeklyChart />&ndash;&gt;-->
<!--&lt;!&ndash;                  </div>&ndash;&gt;-->
<!--&lt;!&ndash;              </div>&ndash;&gt;-->
<!--&lt;!&ndash;              <div class=" center py-8 lg:px-2">  &ndash;&gt;-->
<!--&lt;!&ndash;                <div  class=" p-11 bg-white rounded shadow font-semibold text-center hover:shadow-md">&ndash;&gt;-->
<!--&lt;!&ndash;                  <GroupedBarChart />&ndash;&gt;-->
<!--&lt;!&ndash;                  </div>&ndash;&gt;-->
<!--&lt;!&ndash;              </div>&ndash;&gt;-->

<!--            <HomeTeamChartList />-->
<!--          </div>-->
<!--        </div>-->
     </div>

    <!--    ALL TEAMS CHART MANAGER COMPONENT -->
      <div class="column">

        <div  v-if="this.$store.state.user.role === 'General Manager'" class="mycardChart">
          <span class="text-2xl font-bold mt-5 mb-3">All teams statistics</span>

          <span>Total number of teams: {{ this.numberOfTeams }}</span>
          <span>Total number of employees: {{ this.numberOfEmployees }}</span>
             <div class="profile__user__content">
                          

                <div  class="mt-2 p-11 bg-white rounded shadow font-semibold text-center hover:shadow-md">
                  <TeamsPieChart />
                </div>

                <div class="mt-2 p-11 bg-white rounded shadow font-semibold text-center hover:shadow-md">
                  <GroupedMonthlyChart />
                </div> </div>
             
          </div>
        </div>
     

  </div>
</template>

<script>
import UserMonthlyBarChart from "./User/UserMonthlyBarChart";
import UserOvertimeLineChart from "./User/UserOvertimeLineChart";
import TeamsPieChart from "./Teams/TeamsPieChart";
import LatestAttendance from "./Attendance/LatestAttendance";
import UserPieChart from "./User/UserPieChart";

import Api from '../api'
import GroupedMonthlyChart from "./Charts/GroupedBarChart";

export default {
  name: "Home",
  components: {
    GroupedMonthlyChart,
    UserPieChart,
    LatestAttendance,
    TeamsPieChart,
    UserOvertimeLineChart,
    UserMonthlyBarChart,
  },
  async mounted() {
    this.numberOfTeams = (await Api.getAllTeams()).length
    this.numberOfEmployees = (await Api.getAllUsers()).length
  },
  data() {
    return {
      numberOfTeams: '',
      numberOfEmployees: ''
    }
  }
}
</script>

<style scoped>
.row {
  display: flex;
  flex-wrap: wrap;
  padding: auto;
  width: 100%;
  gap:1rem,
}

.column {
  flex: 0%;
  max-width: 100%;
  padding: 10 10px;
}

.column img {
  margin-top: 8px;
  vertical-align: middle;
}

/* Responsive layout - makes a two column-layout instead of four columns */
@media screen and (max-width: 1000px) {
  .column {
    flex: 100%;
    max-width: 100%;
   /* height: 130rem;*/
   /*grid-template-columns: 1fr;*/
  }
}



  

  .mycardChart{
    max-width:100%;
    background-color: #dee3e5;
    display: flex;
    flex-direction: column;
    text-align: center;
    margin-bottom: 30px;;
    border-radius: 10px;
    max-height: 100%;
    padding: 3.8rem;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
    transition: all .5s ease;
    line-height: 1.4;

  }


</style>