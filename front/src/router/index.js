import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
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
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import("../views/AboutView.vue").catch,
      meta: {
        requiresAuth: false,
      },
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
      path: '/view-order-status',
      name: 'ver-estado-platillo',
      component: () => import('../views/ViewOrderStatusView.vue'),
      meta: {
        requiresAuth: false,
      },
    },
  ],
});

router.beforeEach((to) => {
  const store = useAuthStore();

  if (to.meta.requiresAuth && !store.isLogged) return "/login";
});

export default router;
