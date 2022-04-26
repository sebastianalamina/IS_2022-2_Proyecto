<script>
import NavBar from '../components/NavBar.vue'
import Footer from '../components/Footer.vue'


import { useAxios } from '../axios_common'



export default {
    components:{
        NavBar,
        Footer,
    },
    data(){
      return{ 
        formulario:{
          nombre : '',
          estado :'', 
          calle :'',
          cp : null,
          numero: null,
          municipio :'',
        },
        errores : [],
      }
    },
    methods:{
      
      submitForm: function(e){
        const instance = useAxios();
        console.log('revisando formulario')
        if(this.checarFormulario) 
        {
          console.log('formulario correcto')
          console.log(JSON.stringify(this.formulario))
          instance.post('/restaurante',{
            ...this.formulario
          });
        }
        else
        {
          console.log('formulario incorrecto')
        }
      },
      checarFormulario: function (){
        this.errores=[]
      
       if (!this.formulario.nombre) {
          this.errores.push('Nombre vacio')  
       }
      if (!this.formulario.nombre) {
          this.errores.push('Nombre vacio')  
       }
       if (!this.formulario.estado) {
          this.errores.push('Estado vacio.') 
       }
      if (!this.formulario.calle) {
          this.errores.push('Calle vacia.') 
       }
      if (!this.formulario.cp) {
          this.errores.push('CP vacio') 
       }  
      if (!this.formulario.municipio) {
          this.errores.push('Municipio vacio') 
       }
      if (!this.errores.length){
        return true
      }
      console.log('errores en los datos')
      }
    }

}
</script>

<template>
<NavBar/>
<h1>Registro para restaurantes para restaurante</h1>

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-6">
    <form @submit.prevent="submitForm">

  <div class="form-row">
    <div class="form-group col-md-6">
      <label>Nombre del restaurante</label>
      <input v-model="formulario.nombre"  type="text" class="form-control"  placeholder="Nombre">
    </div>
    <div class="form-group col-md-6">
      <label >Estado </label>
      <input v-model="formulario.estado" type="text" class="form-control" placeholder="Estado">
    </div>
    <div class="form-group col-md-6">
      <label >calle</label>
      <input v-model="formulario.calle" type="text" class="form-control"  placeholder="Calle">
    </div>
    <div class="form-group col-md-6">
      <label >numero</label>
      <input v-model="formulario.numero" type="text" class="form-control"  placeholder="Calle">
    </div>
    <div class="form-group col-md-6">
      <label >Codigo postal</label>
      <input v-model="formulario.cp" type="text" class="form-control"  placeholder="codigo postal" >
    </div>
    <div class="form-group col-md-6">
      <label >Municipio.</label>
      <input v-model="formulario.municipio" type="text" class="form-control" placeholder="municipio">
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
  
  <button type="submit" class="btn btn-primary">Crear restaurante</button>
</form>  
    
        </div>
        <div class="col-lg-6">
           Aqui segun yo va una imagen 
        </div>
    </div>
</div>


<Footer/>


</template>
