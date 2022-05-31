<script>

export default {

}

</script>

<template>
  <div class="topnav">
      <a class="active" href="#inicio">Inicio</a>
      <a href="/inicioW/ordenes">Ordenes</a>
  </div>
  
  <center><h1>Bienvenido</h1></center>
  
  <div style="margin: 50px">
    <div style="width: 20%; float:left">
      <div class="item_title">Mesas</div> 
      <div class="list_container">
	<!-- 
	     - Conectarse a la BD pa saber:
	        + Cuantas mesas tiene asignada
		+ Que mesas tiene libres.(Libres = verde, Ocupadas= rojo)
		+ Mostrar el número de la mesa
	  -->
	<div class="mesa_libre">Mesa 1</div>
	<div class="mesa_ocupada">Mesa 2</div>
	<div class="mesa_ocupada">Mesa 5</div>
	<div class="mesa_libre">Mesa 10</div>
      </div>
    </div>
    
    <div style="width: 80%; float:right">
      <div class="agregar_title">Nuevas Mesas</div>       
    </div>
  </div>
  
</template>


<style>

.topnav {
  overflow: hidden;
  background-color: #e9e9e9;
  //position: fixed;
  //z-index: 1
}

.topnav a {
  float: left;
  display: block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #2196F3;
  color: white;
}

.topnav input[type=text] {
  float: right;
  padding: 6px;
  border: none;
  margin-top: 8px;
  margin-right: 16px;
  font-size: 17px;
}

@media screen and (max-width: 600px) {
  .topnav a, .topnav input[type=text] {
    float: none;
    display: block;
    text-align: left;
    width: 100%;
    margin: 0;
    padding: 14px;
  }
  .topnav input[type=text] {
    border: 1px solid #ccc;
  }
}

.list_container {
direction: ltl;
overflow:auto;
height: 500px;
width: 200px;
}

.mesa_libre {
overflow:auto ;
height: 50px;
width: 200px;
direction:rtr;
border-style: dotted;
border-color: green;
}

.mesa_ocupada {
overflow:auto ;
height: 50px;
width: 200px;
direction:rtr;
border-style: dotted;
border-color: red;
}

.item_title {
background-color: #ddd;
color: blue;
overflow:auto ;
height: 50px;
width: 200px;
direction:rtr;
}

.agregar_title{
background-color: #ddd;
color: blue;
overflow:auto ;
height: 50px;
direction:rtr;
text-align: center;
font-size: 20px;
}

.info_res {
height: 500px;
width: 200px;
}
</style>
