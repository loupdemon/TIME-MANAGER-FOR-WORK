<script>
import { defineComponent } from 'vue'
import { Bar } from 'vue3-chart-v2'

export default defineComponent({
  name: 'MonthlyChart',
  extends: Bar,
  props: ['data', 'labels', 'color'],
  mounted () {
    // Overwriting base render method with actual data.
    this.renderChart({
      labels: this.labels,
      datasets: [
        {
          label: 'Monthly attendance (in hours)',
          backgroundColor: this.color,
          data: this.data
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