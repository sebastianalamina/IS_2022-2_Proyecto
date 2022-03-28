<script>
import NavBar from '../components/NavBar.vue'
import Footer from '../components/Footer.vue'

export default {
    components:{
        NavBar,
        Footer
    },
    data(){
      return{
        formulario:{
          nombre : '',
          email :'', 
          firstSurename :'',
          secondSurename :'',
          password :'',
        },
        errores : [],
      }
    },
    methods:{
      
      submitForm: function(e){
        console.log('revisando formulario')
        if (this.checarFormulario()) {
          console.log('enviando datos')
          console.log(JSON.stringify(this.formulario)) 
          // TODO Agregar el envio de datos via http con REST supogno
          /*
            axios.post('/contact', this.form)
              .then((res) => {
                console.log('solicitud exitosa ')
              })
              .catch((error) => {
                error.response.status
              }).finally(() => {
              TODO
              }); */
        }
      },
      checarFormulario: function (){
        this.errores=[]
       if (!this.formulario.nombre) {
          this.errores.push('Nombre vacio')  
       }
       if (!this.formulario.firstSurename) {
          this.errores.push('Primer apellido vacio') 
       }
      if (!this.formulario.secondSurename) {
          this.errores.push('Segundo apellido vacio') 
       }
      if (!this.formulario.password) {
          this.errores.push('Contrasena vacia') 
       }
      if (!this.validaEmail(this.formulario.email)) {
          this.errores.push('El correo electronico no es valido')
      }
      if (!this.errores.length){
        return true
      }
      console.log('errores en los datos')


      },
      validaEmail: function (email) {
        var re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
      }


    }

}
</script>

<template>
<NavBar/>
<h1>Creacion de cuenta para restaurante</h1>

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-6">
  <form @submit.prevent="submitForm">

  <div class="form-row">
    <div class="form-group col-md-6">
      <label>Nombre</label>
      <input v-model="formulario.nombre"  type="text" class="form-control"  placeholder="Nombre">
    </div>
    <div class="form-group col-md-6">
      <label >Primer apellido </label>
      <input v-model="formulario.firstSurename" type="text" class="form-control" placeholder="Primer apellido">
    </div>
    <div class="form-group col-md-6">
      <label >Segundo apellido</label>
      <input v-model="formulario.secondSurename" type="text" class="form-control"  placeholder="Nombre">
    </div>
    <div class="form-group col-md-6">
      <label >Correo electronico</label>
      <input v-model="formulario.email" type="email" class="form-control"  placeholder="Correo electronico" >
    </div>
    <div class="form-group col-md-6">
      <label >Contrasena</label>
      <input v-model="formulario.password" type="password" class="form-control" placeholder="Contrasena">
    </div>
  </div>

  <div v-if="errores.length != 0"  >
    <b>Corrija los siguientes errores:
    </b>
    <ul>
      <li  v-for="(error,i) in errores" :key="i" >
        {{error}}
      </li>
    </ul>
  </div>
  
  <button type="submit" class="btn btn-primary">Crear usuario</button>
</form>  
        </div>
        <div class="col-lg-6">
           Aqui segun yo va una imagen 
        </div>
    </div>
</div>


<Footer/>


</template>