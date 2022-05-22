<script>
import {useAxios} from "../axios_common";

export default {
  mounted() {
    this.getEmployees();
  },
  data(){
    return{
      empleados_a_enseñar: null,
      id: null,
    }
  },
  methods:{
    getEmployees() {
      const axios = useAxios();

      axios.get('/empleado')
        .then((res) => {
          this.empleados = res.data;
          this.empleados_a_enseñar = JSON.parse(JSON.stringify(this.empleados))
        })
        .catch((error) => {
          console.log(error)
        });
    },
    filtrarID(e) {
      // Para que no recargue la página.
      e.preventDefault();

      // Reiniciando la lista.
      this.empleados_a_enseñar = JSON.parse(JSON.stringify(this.empleados))

      // Si no se introduce ID, no se hace nada.
      if (this.id == null || this.id == "")
        return

      // Filtrando...
      let llave;
      for (llave in this.empleados) {
        this.empleados_a_enseñar[llave] = this.empleados[llave].filter((x) => {
          console.log(x)
          console.log(x["idrestaurante"], this.id)
          return x['idrestaurante'] == parseInt(this.id);
        });
      }

    }
  }
}

</script>

<template>

  <div class="total">
  <div v-for="(lista_empleados, puesto) in empleados_a_enseñar" class="columna">
    <h1>Empleados tipo {{puesto}}</h1>
    <div class="derecha" v-if="puesto !== 'repartidor'">
      Filtrar por ID restaurante:
      <form @submit="filtrarID">
        <input type="number" v-model="this.id">
      </form>
    </div>
    <div v-if="lista_empleados.length == 0">No hay empleados tipo {{puesto}} registrados en la Base de Datos.</div>
    <div class="empleado" v-for="empleado in lista_empleados">
      <!-- <img :src="'src/assets/'+empleado.img"> -->
      {{empleado.nombre}} {{empleado.apatermo}} {{empleado.amaterno}}
      <div class="derecha">
        ID usuario: {{empleado.idusuario}}
      </div>
      <br>
      <div v-if="puesto !== 'repartidor'">
        ID restaurante: {{empleado.idrestaurante}}
      </div>
    </div>
  </div>
  </div>

</template>

<style>

.total {
  padding-top: 20px;
  width: 95%;
  margin: auto;
}

.columna {
  padding-right: 20px;
  float: left;
  width: 33%;
}

.empleado {
  border: 2px solid black;
  padding: 10px 10px;
  margin: 10px 0px;
  font-size: 20px;
}

.derecha{
  padding-top: 0px !important;
  float: right;
}

h1{
  display: inline;
}

form{
  display: inline;
}

input{
  width: 70px;
}

img{
  max-height: 60px;
  float: left;
  padding-right: 15px;
}

</style>
