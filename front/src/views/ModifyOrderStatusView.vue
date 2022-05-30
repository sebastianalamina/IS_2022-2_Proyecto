<script>
import {useAxios} from "../axios_common";

export default {
  data(){
    return{
      nuevo_estado: null,
      nuevo_estado_error: null,
      orden_error: null,
      queried: false,
      id: null,
      estado: 0,
      estados_posibles: ["RECIBIDA","EN_PROCESO","EN_CAMINO","ENTREGADA"],
    }
  },
  methods:{
    cambiar_estado: function(e) {
      // Para que no recargue la página.
      e.preventDefault()

      // Para prevenir errores, se termina
      // si no se introduce algo válido.
      this.nuevo_estado_error = null
      if (this.nuevo_estado == null) {
        this.nuevo_estado_error = "Introduce un valor válido."
        return
      }

      // Hacemos POST con el Back.
      const axios = useAxios();
      axios
        .post('/estado-platillo', {
          id_orden: this.id,
          nuevo_estado: this.nuevo_estado,
        })
        .then((res) => {
          console.log("uwu")//res.data); // DEBUG TEMPORAL.
          console.log(res)
        })
        .catch((error) => {
          console.log(error.response.data);
        })

      // Se vuelve a llamar la función buscarID
      // para cargar el nuevo estado.
      this.buscarID(e)
    },
    async buscarID(e) {
      // Para que no recargue la página.
      e.preventDefault();

      this.orden = null
      this.orden_error = null

      // No continuar si no se introdujo nada
      if (this.id == null) {
        this.orden_error = "Introduce un ID."
        return
      }

      // Consultamos con el Back.
      const axios = useAxios();
      await axios
        .get('/estado-platillo', {
          params: { id_orden:this.id }
        })
        .then((res) => {
          this.orden = res;
        })
        .catch((error) => {
          console.log(error.response.data);
        })

      // Si hubo un error, no se continúa.
      if (this.orden == null) {
        this.orden_error = "Orden no encontrada."
        return
      }

      // Ya se consultó (independientemente de
      // si la orden está disponible o no).
      this.queried = true;

      // Se actualiza el "estado" de la orden.
      // Si no, se queda en "null".
      if (this.orden != null) {
        this.estado = this.orden.data.estado;
        for (var i = 0; i < this.estados_posibles.length; i++)
          if (this.estado == this.estados_posibles[i])
            this.estado = i
      }
    },
  },
}

</script>

<template>

  <div v-if="!this.queried" class="texto">
    <form @submit="buscarID">
      <label class="form-label">Buscar orden por ID:</label><br>
      <input type="number" v-model="this.id"><br>
      <input type="submit" value="Buscar">
      <p class="error" v-if="this.orden_error">{{this.orden_error}}</p>
    </form>
  </div>

  <div v-if="this.queried && this.orden_error == null">

    <div class="texto">
      Estado del pedido #{{this.id}}:

    <div class="texto" v-if="this.estado == null">
      No registrado.
    </div>
    <div class="texto" v-else-if="this.estado == 0">
      Aún no empieza su preparación.
    </div>
    <div class="texto" v-else-if="this.estado == 1">
      En preparación.
    </div>
    <div class="texto" v-else-if="this.estado == 2">
      En camino a su destino.
    </div>
    <div class="texto" v-else-if="this.estado == 3">
      Entregado.
    </div>

    </div>

    <div v-if="this.estado != null">
      <form @submit="cambiar_estado">
        <label class="texto">Nuevo estado de la orden:</label>
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
      <br>
      <form>
        <input class="btn btn-secondary" type="submit" value="Buscar otro pedido">
      </form>
    </div>

  </div>

</template>

<style>

.texto {
  margin: 10px;
  font-size: 24px;
}

.error {
  color: red;
  font-size: 16px;
}


</style>