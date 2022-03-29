<script setup>
import NavBar1 from '../components/NavBar.vue'



</script>
<script>

import NavBar from '../components/NavBar.vue'
import Footer from '../components/Footer.vue';
export default{
  components:{
    NavBar,
    Footer
  }
}
</script>

<template>
<NavBar/>
  <main>
    
  </main>

  <RouterLink v-for="route in this.$router.options.routes" :key="route.path" :to="route.path">
    <div>{{route.name}}</div>
  </RouterLink>

  <Footer/>

</template>
