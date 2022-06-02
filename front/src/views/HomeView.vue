<script setup>
import NavBar from "../components/NavBar.vue";
import { ref } from "vue";
</script>

<template>
  <va-parallax
    target="body"
    src="src/assets/food.webp"
    :height="400"
    :speed="1"
  >
    <div class="title-box">
      <h1 class="display-1 title">FindYourRestaurant</h1>
      <h4 class="display-4 title">¿Por qué esperar para ordenar tu comida?</h4>
    </div>
  </va-parallax>
</template>

<style scoped>
.title {
  color: white;
  padding: 10px;
}
.title-box {
  padding-left: 50px;
  padding-top: 220px;
}
</style>
