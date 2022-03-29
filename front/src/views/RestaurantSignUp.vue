<script>
import NavBar from '../components/NavBar.vue'
import Footer from '../components/Footer.vue'
import RestaurantForm from '../components/RestaurantForm.vue'

export default {
    components:{
        NavBar,
        Footer,
        RestaurantForm
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
        else{
          console.log('los datos no jalaron')
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
    <restaurant-form
    :nombre="formulario.nombre"
    :calle="formulario.calle"
    :cp="formulario.cp"
    :estado="formulario.estado"
    :errores="errores"
    :submitMethod="submitForm"
    :numero="formulario.numero"
    :municipio="formulario.municipio" 
    />
    
        </div>
        <div class="col-lg-6">
           Aqui segun yo va una imagen 
        </div>
    </div>
</div>


<Footer/>


</template>