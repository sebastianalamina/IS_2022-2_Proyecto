import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import LoginView from '../views/LoginView.vue'
import RestaurantSignUp from '../views/RestaurantSignUp.vue'
import MenuView from '../views/MenuView.vue'
import ClientsView from '../views/ClientsView.vue'

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
      path: '/menu',
      name: 'menu',
      component: () => import('../views/MenuView.vue')
    },
    {
	path: '/inicio',
	name: 'inicio',
	component: () => import('../views/ClientsView.vue')
    },
    {
	path: '/inicioW',
	name: 'inicioW',
	component: () => import('../views/WaiterView.vue')
    },
    {
	path: '/inicioW/ordenes',
	name: 'inicioW_ordenes',
	component: () => import('../views/OrdenesView.vue')
    },
  ]
})

export default router
