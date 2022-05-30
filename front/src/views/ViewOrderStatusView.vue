<script>
import {useAxios} from "../axios_common";

export default {
  data(){
    return{
      queried: false, // ¿Ya se introdujo un ID?
      id: null, // Lo introducirá el usuario.
      estado: null, // Valores null, 0, 1, 2 y 3.
      orden: null, // Resultado de GET.
      estados_posibles: ["RECIBIDA","EN_PROCESO","EN_CAMINO","ENTREGADA"],
    }
  },
  methods:{
    async buscarID(e) {
      // Para que no recargue la página.
      e.preventDefault();

      // No continuar si no se introdujo nada
      if (this.id == null)
        return

      // Consultamos con el Back.
      const axios = useAxios();
      await axios
        .get('/estado-platillo',
          {params: { id_orden:this.id }})
        .then((res) => {
          this.orden = res;
        })
        .catch((error) => {
          console.log(error.response.data)
        })

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
    reiniciar(e) {
      // Reseteamos "queried" para volver a preguntarle
      // al usuario por un ID, y "estado" para limpiar.
      // "id" se queda igual para que
      // el usuario pueda volver a ver lo que introdujo.
      this.queried = false;
      this.orden = null;
      this.estado = null;
    },
  },
}

</script>

<template>

  <div v-if="this.queried">

    <h1 class="texto">
      ESTADO DEL PEDIDO #{{this.id}}
    </h1>

    <div class="container">
      <div class="row">
        <div class="caja" :class="[(this.estado == null) ? 'en-curso' : (this.estado >= 0) ? 'completado' : '']">
          Orden recibida.
        </div>
        <div class="caja" :class="[(this.estado == 1) ? 'en-curso' : (this.estado > 1 ? 'completado' : '')]">
          Preparando...
        </div>
        <div class="caja" :class="[(this.estado == 2) ? 'en-curso' : (this.estado > 2 ? 'completado' : '')]">
          ¡Listo! En camino...
        </div>
        <div class="caja" :class="[(this.estado == 3) ? 'completado' : '']">
          Orden entregada.
        </div>
      </div>
    </div>

    <div class="texto" v-if="this.estado == null">
      La orden #{{this.id}} no ha sido recibida en el sistema.
    </div>
    <div class="texto" v-else-if="this.estado == 0">
      La orden ya fue recibida, y pronto empezará a ser preparada.
    </div>
    <div class="texto" v-else-if="this.estado == 1">
      La orden ya fue recibida, y está siendo preparada.
    </div>
    <div class="texto" v-else-if="this.estado == 2">
      La orden ya está lista, ¡va en camino a su destino!
    </div>
    <div class="texto" v-else-if="this.estado == 3">
      La orden ya fue entregada. ¡Disfrute!
    </div>

    <form @submit="reiniciar">
      <input class="container form-control" type="submit" value="Buscar otro pedido">
    </form>

  </div>

  <div v-else class="texto">
    <form @submit="buscarID">
      <label class="form-label">Introduce el ID de la orden a consultar:</label><br>
      <input type="number" v-model="id"><br>
      <input type="submit" value="Buscar">
    </form>
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