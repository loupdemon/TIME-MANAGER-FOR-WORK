import { createApp } from 'vue'
import App from './App.vue'
import './assets/tailwind.css'
import router from './router'
import './index.css'
import { SnackbarService, Vue3Snackbar } from "vue3-snackbar";
import "vue3-snackbar/dist/style.css";


import { createStore } from 'vuex'

// Create a new store instance.
const store = createStore({
    state () {
        return {
            user: {
                id: null,
                role: null
            }
        }
    }
})
const app = createApp(App).use(router)
app.use(router)
app.use(store)
app.use(SnackbarService)
app.component("vue3-snackbar", Vue3Snackbar)
app.mount('#app')
