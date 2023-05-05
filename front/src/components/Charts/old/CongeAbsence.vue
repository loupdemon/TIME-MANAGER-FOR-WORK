<template>
<main class=" center py-8 sm:px-64">            
  <div class="p-4">

                <div  class="mt-4 p-4 bg-white rounded shadow font-semibold text-center hover:shadow-md">
                    <vue3-chart-js
                        :id="doughnutChart.id"
                        :type="doughnutChart.type"
                        :data="doughnutChart.data"
                        @before-render="beforeRenderLogic"
                    ></vue3-chart-js>
                    
                 </div>
            </div>
        </main>
  
</template>

<script>
import Vue3ChartJs from '@j-t-mcc/vue3-chartjs'

export default {
  name: 'App',
  components: {
    Vue3ChartJs,
  },
  setup () {
    const doughnutChart = {
      id: 'doughnut',
      type: 'doughnut',
      data: {
        labels: ['Presents','absents'],
        datasets: [
          {
            label: "statistique des presence des employés dans l'entreprise",
            backgroundColor: [
              '#41B883',
              '#E46651',
            
            ],
            data: [95,5]
          }
        ]
      }
    }

    // const beforeRenderLogic = (event) => {
    //   ...
    //   if(a === b) {
    //    event.preventDefault()
    //   }
    // }

    return {
      doughnutChart,
      // beforeRenderLogic
    }
  },
   methods: {
  onInput() {
      this.filterData()
  },
  updateChart(data) {
    this.datasets = [{
          label: ["popularity"],
          backgroundColor:"#f93232",
          data: data
      }]
  },

  async loadData() {
    await this.$axios.get(this.url)
      .then(response => {
        this.updateChart(response.data)
      })
  },
},

mounted() {
   this.loadData()
 },

}
</script>