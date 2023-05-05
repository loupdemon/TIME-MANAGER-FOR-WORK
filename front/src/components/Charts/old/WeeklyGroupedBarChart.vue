<script>
import { defineComponent } from 'vue'
import { Bar } from 'vue3-chart-v2'

export default defineComponent({
  name: 'GroupedWeeklyChart',
  extends: Bar,
  props: ['dataArray', 'labels', 'color'],
  mounted () {
    // Overwriting base render method with actual data.
    this.renderChart({
      labels: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5'],
      datasets: [
        {
          label: 'Charmander',
          backgroundColor: '#ffa600',
          data: [7, 8, 8.5, 7.4, 9]
        },
        {
          label: 'Squirtle',
          backgroundColor: '#ef5675',
          data: [8.1, 8, 7.5, 7.4, 8]
        },
        {
          label: 'Ash',
          backgroundColor: '#7a5195',
          data: [9, 8.8, 8.1, 7.8, 7]
        },
        {
          label: 'Brocks',
          backgroundColor: '003f5c',
          data: [7.8, 8.6, 8.2, 7.2, 8.1]
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