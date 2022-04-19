<script>

export default {
  data(){
    return{
      platillo:{
        id: 4502, // Lo introducirá el usuario.
        estado: null, // Valores null, 0, 1, 2 y 3.
      },
    }
  },
  methods:{
  },
}

</script>

<template>

  <div v-if="this.platillo.id">

    <div class="texto">
      Estado del pedido #{{this.platillo.id}}...
    </div>

    <div class="container">
      <div class="row">
        <div class="caja" :class="[(this.platillo.estado == null) ? 'en-curso' : (this.platillo.estado >= 0) ? 'completado' : '']">
          Orden recibida.
        </div>
        <div class="caja" :class="[(this.platillo.estado == 1) ? 'en-curso' : (this.platillo.estado > 1 ? 'completado' : '')]">
          Preparando...
        </div>
        <div class="caja" :class="[(this.platillo.estado == 2) ? 'en-curso' : (this.platillo.estado > 2 ? 'completado' : '')]">
          ¡Listo! En camino...
        </div>
        <div class="caja" :class="[(this.platillo.estado == 3) ? 'completado' : '']">
          Orden entregada.
        </div>
      </div>
    </div>

    <div class="texto" v-if="this.platillo.estado == null">
      El pedido #{{this.platillo.id}} no ha sido recibido.
    </div>
    <div class="texto" v-else-if="this.platillo.estado == 0">
      El pedido ya fue recibido, y pronto empezará a ser preparado.
    </div>
    <div class="texto" v-else-if="this.platillo.estado == 1">
      El pedido ya fue recibido, y está siendo preparado.
    </div>
    <div class="texto" v-else-if="this.platillo.estado == 2">
      El pedido ya está listo, ¡va en camino a su destino!
    </div>
    <div class="texto" v-else-if="this.platillo.estado == 3">
      El pedido ya fue entregado. ¡Disfrute!
    </div>

  </div>

</template>

<style>

.texto {
  margin: 20px;
  font-size: 30px;
}

.caja {
  border: 2px solid black;
  width: 25%;
  height: 50px;
}

.completado {
  background-color: #53b853;
}

.en-curso {
  background-color: #c4ad52;
}

</style>