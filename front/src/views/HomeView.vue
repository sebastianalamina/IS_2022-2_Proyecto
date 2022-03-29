<script setup></script>

<template>
  <main>
    <h1>Hola primer proyecto</h1>
  </main>

  <RouterLink v-for="route in this.$router.options.routes" :key="route.path" :to="route.path">
    <div>{{route.name}}</div>
  </RouterLink>

</template>
