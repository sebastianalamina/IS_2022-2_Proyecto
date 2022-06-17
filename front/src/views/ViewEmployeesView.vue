<script>
import {useAxios} from "../axios_common";
import {useStore as useAuthStore } from "../stores/auth";
import roles from "../constants/roles";



export default {
  mounted() {
    this.getEmployees();
  },
  data(){
    return{
      empleados: {},
      createEmpleado : false, 
      listaKey : 0,
      errorMensaje: null,
      showError: false,
      datosEmpleado: {
        email : null,
        rol : roles.MESERO,
      },
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
          this.errorMensaje = err.response.data.error; 
          this.showError = true;
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
          return x['idrestaurante'] == parseInt(this.id);
        });
      }
    },
    isAdmin(){
      const auth = useAuthStore();
      return auth.hasPermisionsOf(roles.ADMINISTRADOR) 
    }
  }
}

</script>

<template>


  <div class="columna">
    <div v-if="this.isAdmin()">
    <va-button icon-right="create" class="mr-4" @click="createEmpleado = !createEmpleado" > Habilitar empleado</va-button> 
    <div v-if="createEmpleado">
    <h1 > Inserte el correo electronico del usuario</h1>
    <p>
      Para poder agregar un empleado, es encesario que el usuario tenga una cuenta en la plataforma.
    La cuenta se puede crear <router-link to="/user-signup" > <b> en este link</b> </router-link>
    </p> 
    <br>
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
      <div v-if="showError">
      <va-alert color="danger" outline class="mb-4">  
        <p v-if="errorMensaje === 'El usuario no existe'">
        El usuario no existe, por favor creelo antes de crear un perfil de empleado. Puede crearlo 
        <router-link to="/user-signup" > <b>con este link</b> </router-link>
        </p>
        <p v-else >
        {{errorMensaje}}
        </p>
      </va-alert>
      </div>
    </div> 
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
