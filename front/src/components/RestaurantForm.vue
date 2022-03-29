<script>
export default {
    props: {
    nombre : String,
    calle : String,
    numero : Number,
    cp : Number,
    municipio : String,
    estado : String,
    errores : Array,
    submitMethod : Function
    }
}
</script>


<template>

<form @submit.prevent="submitMethod">

  <div class="form-row">
    <div class="form-group col-md-6">
      <label>Nombre del restaurante</label>
      <input v-model="nombre"  type="text" class="form-control"  placeholder="Nombre">
    </div>
    <div class="form-group col-md-6">
      <label >Estado </label>
      <input v-model="estado" type="text" class="form-control" placeholder="Estado">
    </div>
    <div class="form-group col-md-6">
      <label >calle</label>
      <input v-model="calle" type="text" class="form-control"  placeholder="Calle">
    </div>
    <div class="form-group col-md-6">
      <label >Codigo postal</label>
      <input v-model="cp" type="text" class="form-control"  placeholder="codigo postal" >
    </div>
    <div class="form-group col-md-6">
      <label >Municipio.</label>
      <input v-model="municipio" type="text" class="form-control" placeholder="municipio">
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
</template>