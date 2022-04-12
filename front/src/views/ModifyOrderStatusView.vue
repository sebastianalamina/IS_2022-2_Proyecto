<script>

export default {
  data(){
    return{
      nuevo_estado: null,
      nuevo_estado_error: '',
      platillo:{
        id: 4502, // Lo introducirá el usuario.
        estado: 0, // Valores null, 0, 1, 2 y 3.
      },
    }
  },
  methods:{
    cambiar_estado: function(e) {
      e.preventDefault()
      if (this.nuevo_estado == null) {
        this.nuevo_estado_error = "Introduce un valor válido."
        return
      }
      this.nuevo_estado_error = ''
      this.platillo.estado = this.nuevo_estado
      this.nuevo_estado = null
    }
  },
}

</script>

<template>

  <div v-if="this.platillo.id">

    <div class="texto">
      Estado del pedido #{{this.platillo.id}}:
    </div>

    <div class="texto" v-if="this.platillo.estado == null">
      No registrado.
    </div>
    <div class="texto" v-else-if="this.platillo.estado == 0">
      Aún no empieza su preparación.
    </div>
    <div class="texto" v-else-if="this.platillo.estado == 1">
      En preparación.
    </div>
    <div class="texto" v-else-if="this.platillo.estado == 2">
      En camino a su destino.
    </div>
    <div class="texto" v-else-if="this.platillo.estado == 3">
      Entregado.
    </div>

    <div v-if="this.platillo.estado != null">
      <form @submit="cambiar_estado">
        <label class="texto">Nuevo estado del platillo:</label>
        <select class="form-select form-select-lg mb-3" name="nuevo-estado" v-model="nuevo_estado">
          <option value="0">Recibido (aún no empieza su preparación)</option>
          <option value="1">En preparación</option>
          <option value="2">En camino</option>
          <option value="3">Entregado</option>
        </select>
        <div class="error" v-if="this.nuevo_estado_error != ''">
          {{this.nuevo_estado_error}}
        </div>
        <input class="btn btn-secondary" type="submit" value="Aceptar">
      </form>
    </div>

  </div>

</template>

<style>

.texto {
  margin: 10px;
  font-size: 18px;
}

.error {
  color: red;
  font-size: 16px;
}


</style>