
import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import LoginView from '../views/LoginView.vue'
import RestaurantSignUp from '../views/RestaurantSignUp.vue'
import MenuView from '../views/MenuView.vue'
import ClientsView from '../views/ClientsView.vue'
import { useStore as useAuthStore } from "../stores/auth";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "home",
      component: HomeView,
      meta: {
        requiresAuth: false,
      },
    },
    {
      path: "/about",
      name: "about",
      component: () => import("../views/AboutView.vue").catch,
      meta: {
        requiresAuth: false,
      },
    },
    {
      path: '/inventario/:id',
      name: 'inventario restaurante',
      component: () => import('../views/Inventario.vue')
    },
    {
      path: "/login",
      name: "login",
      component: () => import("../views/LoginView.vue"),
      meta: {
        requiresAuth: false,
      },
    },
    {
      path: "/restaurant-signup",
      name: "registro-restaurante",
      component: () => import("../views/RestaurantSignUp.vue"),
      meta: {
        requiresAuth: false,
      },
    },
    {
      path: '/user-signup',
      name: 'user-signup',
      component: () => import('../views/UserSignUpView.vue'),
      meta: {
        requiresAuth: false,
      },
    },
    {
      path: '/view-employees',
      name: 'ver-empleados',
      component: () => import('../views/ViewEmployeesView.vue'),
      meta: {
        requiresAuth: false,
      },
    },
    {
      path: '/view-order-status',
      name: 'ver-estado-platillo',
      component: () => import('../views/ViewOrderStatusView.vue'),
      meta: {
        requiresAuth: false,
      },
    },
    {
      path: '/modify-order-status',
      name: 'modificar-estado-platillo',
      component: () => import('../views/ModifyOrderStatusView.vue'),
      meta: {
        requiresAuth: false,
      },
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
    {
      path: '/ordenes',
      name: 'ordenes_cliente',
      component: () => import('../views/OrdenesClienteView.vue')
    },
    {
      path: '/carrito',
      name: 'carrito',
      component: () => import('../views/CarritoView.vue')
    }
  ]
});

router.beforeEach((to) => {
  const store = useAuthStore();

  if (to.meta.requiresAuth && !store.isLogged) return "/login";
});

export default router;
