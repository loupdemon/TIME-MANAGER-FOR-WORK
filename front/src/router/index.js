import { createRouter, createWebHistory } from 'vue-router'
import Home from '../components/Home.vue'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
  },
  {
    path: '/employees',
    name: 'Employees',
    component: () => import('../components/Employees.vue'),
  },
  {
    path: '/profile',
    name: 'My profile',
    component: () => import('../components/Profile.vue'),
  },
  {
    path: '/profile/:id',
    name: 'Profile',
    component: () => import('../components/Profile.vue'),
  },
  {
    path: '/attendance',
    name: 'My attendance',
    component: () => import('../components/Attendance.vue'),
  },
  {
    path: '/attendance/:id',
    name: 'Attendance',
    component: () => import('../components/Attendance.vue'),
  },
  {
    path: '/colleagues',
    name: 'My colleagues',
    component: () => import('../components/Colleagues.vue')
  },
  {
    path: '/team/all',
    name: 'Teams - All',
    component: () => import('../components/AllTeams.vue')
  },
  {
    path: '/team/:id',
    name: 'Team Profile',
    component: () => import('../components/Team.vue')
  },
  {
    path: '/schedule',
    name: 'My Schedule',
    component: () => import('../components/Schedule.vue')
  },
  {
    path: '/schedule/:id',
    name: 'Schedule',
    component: () => import('../components/Schedule.vue')
  },
  {
    path: '/calendar',
    name: 'calendar',
    component: () => import('../components/Calendar.vue')
  },
  {
    path: '/:catchAll(.*)',
    name: 'Not found',
    component: () => import('../components/Errors/NotFound.vue')
  }
]
const router = createRouter({
  history: createWebHistory(),
  routes,
})

// BEFORE EACH HERE: check local storage and requests the user then compare it with the store

export default router
