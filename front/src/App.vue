<script setup>
import { RouterLink, RouterView } from "vue-router";
import { useRouter } from "vue-router";
import NavBar from "./components/NavBar.vue";
import { useStore as useAuth } from "./stores/auth";
import {
  INVITADO,
  CLIENTE,
  MESERO,
  COCINERO,
  ADMINISTRADOR,
  REPARTIDOR,
} from "./constants/roles";

const auth = useAuth();
const router = useRouter();

auth.login("token", { rol: CLIENTE });
</script>

<template>
  <NavBar />
  <RouterView />
</template>
