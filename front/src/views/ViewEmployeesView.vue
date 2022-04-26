<script>
import {useAxios} from "../axios_common";

export default {
  mounted() {
    this.getEmployees();
  },
  data(){
    return{
      empleados: null,
    }
  },
  methods:{
    getEmployees() {
      const axios = useAxios();

      axios.get('/empleado')
        .then((res) => {
          this.empleados = res.data;
        })
        .catch(console.log)
    },
  }
}

</script>

<template>

  <div class="columna">
  <div v-for="(lista_empleados, puesto) in empleados">
    <h1>Empleados tipo {{puesto}}</h1>
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

.columna {
  padding-top: 20px;
  width: 60%;
  margin: auto;
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

img{
  max-height: 60px;
  float: left;
  padding-right: 15px;
}

</style>
