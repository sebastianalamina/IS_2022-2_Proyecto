import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import LoginView from '../views/LoginView.vue'
import RestaurantSignUp from '../views/RestaurantSignUp.vue'
import UserSignUpView from '../views/UserSignUpView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/about',
      name: 'about',
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import('../views/AboutView.vue')
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('../views/LoginView.vue')
    },
    {
      path: '/restaurant-signup',
      name: 'registro-restaurante',
      component: () => import('../views/RestaurantSignUp.vue')
    },
    {
      path: '/user-signup',
      name: 'user-signup',
      component: () => import('../views/UserSignUpView.vue')
    }
  ]
})

export default router
