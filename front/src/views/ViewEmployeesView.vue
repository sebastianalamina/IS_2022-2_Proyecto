<script>
import {useAxios} from "../axios_common";

export default {
  mounted() {
    this.getEmployees();
  },
  data(){
    return{
      empleados: {},
      createEmpleado : false,
      datosEmpleado: {
        email : null,
        rol : "MESERO",
      },
      listaKey : 0
    }
  },
  methods:{
    getEmployees() {
      const axios = useAxios();

      axios.get('/empleado')
        .then((res) => {
          console.log(JSON.stringify(res.data))
          this.empleados = res.data.meseros;
        })
        .catch((err)=>{
          console.log(err)
        });
    },
    turnOnForm(){
      this.createEmpleado = true;
      console.log("funciona")
    },
    handleSubmit (e){
      console.log("Haciendo solicitud post ");
      const instance = useAxios();
      instance.post('/empleado', {
        ...this.datosEmpleado,
      })
        .then((res) => {
          console.log(JSON.stringify(res.data))
          this.getEmployees();
          this.createEmpleado = false;
        })
        .catch((err)=>{
          console.log(err.response.data.error)
        });
    },
    eliminarEmpleado(id){
      console.log("Eliminar empleado " + id);
      const instance = useAxios();
      instance.delete("/empleado/mesero", {
        params: {
          idusuario: id
        }
      })
        .then((res) => {
          this.getEmployees();
          this.listaKey += 1;
          console.log("la lista key es esto",this.listaKey);
        })
        .catch((err)=>{
          console.log(err.response.data.error)
        });
    },
  }
}

</script>

<template>


  <div class="columna">
  
    <va-button icon-right="create" class="mr-4" @click="createEmpleado = !createEmpleado" > Habilitar empleado</va-button> 
    <div v-if="createEmpleado">
    <h1 > Inserte el correo electronico del usuario</h1>
        <va-form 
        tag="form"
        style="width : 300px"
        @submit.prevent="handleSubmit"
        > 

        <va-input
        class="mb-4"
        label="Email" 
        v-model="datosEmpleado.email"
        :rules = "[value => (value && value.length > 0) || 'Correo electronico es necesario']"
        />

        <va-select
        v-model="datosEmpleado.rol"
        :options="['MESERO']"
        :rules = "[value => (value && value.length > 0) || 'Rol es necesario']"
        label="Rol"
        /> 
        
        <va-button 
        type="submit" 
        class="mt-2"
        >
          Crear perfil empleado
        </va-button>
      </va-form>
    </div> 

  <h1> Lista de empleados:</h1>
  

  <va-list
  :key="listaKey" 
  >
    <va-list-label>
      Meseros
    </va-list-label>
    <va-list-item v-for="empleado in empleados" :key="empleado.usuario.idusuario">
      <va-list-item-section>
        <va-list-item-label>
        {{empleado.usuario.nombre + " " + empleado.usuario.apatermo + " " + empleado.usuario.amaterno }}
        </va-list-item-label>
        <va-list-item-label>
          Email : {{empleado.usuario.email}}
        </va-list-item-label>
        <va-list-item-label>
          Confirmado : {{empleado.usuario.confirmado}}
        </va-list-item-label>
      </va-list-item-section >

      <va-button
      @click="eliminarEmpleado(empleado.usuario.idusuario)"
      >
        Eliminar empleado
      </va-button>
    </va-list-item>
  </va-list>


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
