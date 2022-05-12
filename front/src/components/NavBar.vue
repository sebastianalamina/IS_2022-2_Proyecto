<script setup>
import { reactive, ref, computed } from "@vue/reactivity";
import { useRoute } from "vue-router";
import { useStore as useAuthStore } from "../stores/auth";
import roles from "../constants/roles";

//incluimos desde un inicio las rutas de invitado
const auth = useAuthStore();
const links = reactive([
  { name: "home", path: "/" },
  {
    path: "/about",
    name: "about",
  },
  {
    path: "/lista-restaurantes",
    name: "lista de restaurantes",
  },
]);

//links
if (auth.hasPermisionsOf(roles.CLIENTE)) {
  links.push({ path: "/inicioW/ordenes", name: "inicio_ordenes" });
}

if (auth.hasPermisionsOf(roles.ADMINISTRADOR)) {
  links.push({ name: "ver-empleados", path: "/view-employees" });
}
if (auth.hasPermisionsOf(roles.CLIENTE)) {
  links.push({
    path: "/view-order-status",
    name: "ver-estado-platillo",
  });
}
if (
  auth.hasPermisionsOf(roles.MESERO) ||
  auth.hasPermisionsOf(roles.REPARTIDOR)
) {
  links.push({
    path: "/modify-order-status",
    name: "modificar-estado-platillo",
  });
}

const tabIx = computed(() => {
  return links.findIndex((x) => x.name == useRoute().name) + 1;
});
</script>

<template>
  <va-navbar color="primary">
    <template #left>
      <va-navbar-item>FindYourRestaurants</va-navbar-item>
    </template>
    <template #right>
      <va-navbar-item v-if="auth.isLogged">
        <va-popover message="salir">
          <va-button> <va-icon name="logout" /></va-button>
        </va-popover>
      </va-navbar-item>
      <va-navbar-item v-if="!auth.isLogged">
        <va-popover message="login">
          <va-button href="/login"> <va-icon name="login" /></va-button>
        </va-popover>
      </va-navbar-item>
    </template>
  </va-navbar>
  <va-tabs v-model="tabIx">
    <template #tabs>
      <va-tab v-for="tab in links" :key="tab">
        <a :href="tab.path">{{
          tab.name.replaceAll("-", " ").replaceAll("_", " ")
        }}</a>
      </va-tab>
    </template>
  </va-tabs>
</template>

<style>
a {
  color: inherit; /* blue colors for links too */
  text-decoration: inherit; /* no underline */
}
</style>
