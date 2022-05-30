<script setup>
import { RouterLink, RouterView } from "vue-router";
import NavBar from "./components/NavBar.vue";
import { useStore as useAuth } from "./stores/auth";

//hardocodeo para cambiar de usuario
//TODO: borrar
const auth = useAuth();
//auth.login("token", { rol: "REPARTIDOR" });
</script>

<template>
<NavBar/>
<RouterView />
</template>
