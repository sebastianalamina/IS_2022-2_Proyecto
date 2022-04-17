<script>

export default {
  data(){
    return{
      empleados:[
        {
          img: 'Empleado.png',
          nombre:"A",
          puesto:"Mesero",
          estado:"Estado",
        }, {
          img: 'Empleado.png',
          nombre:"B",
          puesto:"Mesero",
          estado:"Estado",
        }, {
          img: 'Empleado.png',
          nombre:"C",
          puesto:"Mesero",
          estado:"Estado",
        },
      ],
    }
  },
  methods:{
  }
}

</script>

<template>

  <div class="columna">
    <div class="empleado" v-for="empleado in empleados">
      <img :src="'src/assets/'+empleado.img">
      {{empleado.nombre}}
      <div class="derecha">
        {{empleado.estado}}
      </div>
      <br>
      {{empleado.puesto}}
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
  float: right;
}

img{
  max-height: 60px;
  float: left;
  padding-right: 15px;
}

</style>
