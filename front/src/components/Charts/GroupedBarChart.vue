<script>
import { defineComponent } from 'vue'
import { Bar } from 'vue3-chart-v2'

export default defineComponent({
  name: 'GroupedMonthlyChart',
  extends: Bar,
  props: ['customLabels', 'customDataSet'],
  mounted () {
    // Overwriting base render method with actual data.
    this.renderChart({
      labels: ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
      datasets: [
        {
          label: 'Jeremy',
          backgroundColor: '#ffa600',
          data: [35, 37, 38, 35]
        },
        {
          label: 'Zemmour',
          backgroundColor: '#ef5675',
          data: [36, 35, 36, 35]
        },
        {
          label: 'Vy',
          backgroundColor: '#7a5195',
          data: [38, 36, 37, 35]
        },
        {
          label: 'Jordan',
          backgroundColor: '003f5c',
          data: [36, 35, 37, 38]
        }
      ]
    }, {
      responsive: true,
      scales: {
        yAxes: [{
          display: true,
          ticks: {
            beginAtZero: true   // minimum value will be 0.
          }
        }]

      }
    })
  }
})
</script>