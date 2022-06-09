<script setup>
import NavBar from "../components/NavBar.vue";
import { ref } from "vue";
</script>

<template>
  <va-parallax target="body" src="/food.webp" :height="400" :speed="1">
    <div class="title-box">
      <h1 class="display-1" style="color: white">FindYourRestaurant</h1>
      <h4 class="display-4" style="color: white">
        Porque esperar para ordenar tu comida.
      </h4>
    </div>
  </va-parallax>
</template>

<style scoped>
.custom-title {
  padding: 10px;
}
.title-box {
  padding-left: 50px;
  padding-top: 220px;
}
</style>
