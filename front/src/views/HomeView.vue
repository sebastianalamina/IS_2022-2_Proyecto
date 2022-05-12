<script setup>
import NavBar from "../components/NavBar.vue";
import Footer from "../components/Footer.vue";
import { useAxios } from "../axios_common";

const axios = useAxios();

function sendAxiosAuth() {
  axios.get("/").then(console.log);
}
</script>

<template>
  <main>
    <button @click="sendAxiosAuth"></button>
  </main>

  <RouterLink
    v-for="route in this.$router.options.routes"
    :key="route.path"
    :to="route.path"
  >
    <div>{{ route.name }}</div>
  </RouterLink>

  <Footer />
</template>
