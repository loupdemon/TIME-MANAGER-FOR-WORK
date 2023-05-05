<script>
import { defineComponent } from 'vue'
import { Pie } from 'vue3-chart-v2'

export default defineComponent({
  name: 'PieChart',
  extends: Pie,
  props: ['data', 'labels', 'color'],
  mounted () {
    // Overwriting base render method with actual data.
    this.renderChart({
      labels: this.labels,
      datasets: [
        {
          label: 'Overtime hours (in hours)',
          backgroundColor: this.color,
          data: this.data
        }
      ]
    })
  }
})
</script>