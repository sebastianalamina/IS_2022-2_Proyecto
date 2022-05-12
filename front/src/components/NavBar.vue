<script>
import { useCarrito } from '../stores/carrito'

export default{
  setup(){
    const store = useCarrito()
    return {store}
  }
}

</script>

<template>
  <!-- As a link -->
<nav class="navbar sticky-top navbar-light bg-light">
  <a class="navbar-brand" href="/"> Find my food  </a>
  <a href="/carrito"> Carrito: {{store.cantidadPlatillos}}</a>
</nav>

</template>