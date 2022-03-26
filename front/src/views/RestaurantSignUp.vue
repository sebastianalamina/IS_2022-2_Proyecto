<script>
import NavBar from '../components/NavBar.vue'
import Footer from '../components/Footer.vue'
export default {
    components:{
        NavBar,
        Footer
    }
}
</script>

<template>
<NavBar/>
<h1>Creacion de cuenta para restaurante</h1>

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-6">
      <form>

  <div class="form-row">
    <div class="form-group col-md-6">
      <label>Nombre</label>
      <input type="text" class="form-control"  placeholder="Nombre">
    </div>
    <div class="form-group col-md-6">
      <label >Primer apellido </label>
      <input type="text" class="form-control" placeholder="Primer apellido">
    </div>
    <div class="form-group col-md-6">
      <label >Segundo apellido</label>
      <input type="text" class="form-control"  placeholder="Nombre">
    </div>
    <div class="form-group col-md-6">
      <label >Correo electronico</label>
      <input type="email" class="form-control"  placeholder="Correo electronico" >
    </div>
    <div class="form-group col-md-6">
      <label >Contrasena</label>
      <input type="password" class="form-control" placeholder="Contrasena">
    </div>
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