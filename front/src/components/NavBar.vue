<script setup>
import { reactive, ref, computed } from "@vue/reactivity";
import { useRoute } from "vue-router";
import { useStore as useAuthStore } from "../stores/auth";
import roles from "../constants/roles";

//incluimos desde un inicio las rutas de invitado
const auth = useAuthStore();

// if (auth.hasPermisionsOf(roles.CLIENTE)) {
//   links.push({
//     path: "/view-order-status",
//     name: "ver-estado-platillo",
//   });
// }

// const tabIx = computed(() => {
//   return links.findIndex((x) => x.name == useRoute().name) + 1;
// });

function logout() {
  auth.logout();
}
</script>

<template>
  <div>
    <va-navbar color="primary">
      <template #left>
        <router-link to="/">
          <va-navbar-item>FindYourRestaurants</va-navbar-item>
        </router-link>
      </template>
      <template #right>
        <va-navbar-item v-if="auth.isLogged">
          <va-popover message="salir">
            <va-button @click="logout"> <va-icon name="logout" /></va-button>
          </va-popover>
        </va-navbar-item>
        <va-navbar-item v-if="!auth.isLogged">
          <va-popover message="login">
            <va-button>
              <router-link to="/login"><va-icon name="login" /></router-link>
            </va-button>
          </va-popover>
        </va-navbar-item>
      </template>
    </va-navbar>
    <va-tabs v-model="tabIx">
      <template #tabs>
        <va-tab>
          <router-link to="/">Home</router-link>
        </va-tab>
        <va-tab>
          <router-link to="/lista-restaurantes">Restaurantes</router-link>
        </va-tab>
        <va-tab v-if="auth.hasPermisionsOf(roles.ADMINISTRADOR)">
          <router-link to="/view-employees">Empleados</router-link>
        </va-tab>
      </template>
    </va-tabs>
  </div>
  <!--  -->
</template>

<style>
a {
  color: inherit; /* blue colors for links too */
  text-decoration: inherit; /* no underline */
}
.va-tabs {
  padding-bottom: 30px;
}
</style>
