<script>
  import NavBar from '../components/NavBar.vue'
  import Footer from '../components/Footer.vue'
</script>

<template>
  <NavBar/>

  <center><h1>Bienvenido</h1></center>

  <div class="topnav">
      <a class="active" href="">Inicio</a>
      <a href="/foros">Foros</a>     <!-- Alta prioridad-->
      <a href="/ordenes">Ordenes</a> <!-- Esta ya esta, pero no en main-->
      <a href="/carrito">Carritos</a> <!-- Igual que arriba -->
      <input type="text" placeholder="Buscar.."> <!-- Conectarse a la BD para mostrar los R-->
  </div>
        
  <div style="margin: 50px">
    <div style="width: 20%; float:left">
      <div class="item_title">Tus Restaurantes Favoritos </div> 
      <div class="list_container">
	<!-- 
	     - Conectarse a la BD pa sacar los restaurantes que sigue.
	     - Mostrar imagenes de la BD.
	     - Al tocarlos se muestra a la derecha la imagene y opiniones
	     - Sacar la hora y saber si estan abiertos o cerrados?
	  -->
	<div class="item_direction">Restaurante 1</div> 
	<div class="item_direction">Restaurante 2</div>
	<div class="item_direction">Restaurante 3</div>
	<div class="item_direction">Restaurante 4</div>
	<div class="item_direction">Restaurante 5</div>
	<div class="item_direction">Restaurante 6</div>
	<div class="item_direction">Restaurante 7</div>
	<div class="item_direction">Restaurante 8</div>
	<div class="item_direction">Restaurante 9</div>
	<div class="item_direction">Restaurante 10</div>
	<div class="item_direction">Restaurante 11</div>
      </div>
    </div>
    
    <div style="width: 80%; float:right">
      
    </div>
  </div>

  <Footer/>
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

.item_direction {
overflow:auto ;
height: 50px;
width: 200px;
direction:rtr;
}
.item_title {
background-color: #ddd;
color: blue;
overflow:auto ;
height: 50px;
width: 200px;
direction:rtr;
}


.info_res {
height: 500px;
width: 200px;
}
</style>
