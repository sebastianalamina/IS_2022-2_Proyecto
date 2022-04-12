<script>

import NavBar from '../components/NavBar.vue'
import Footer from '../components/Footer.vue'

export default {
     components:{
        NavBar,
        Footer,
    },
    data() {
        return {
            cards: [
                {nombre: 'Hamburguesa', src: '@/assets/Hamburguesa.jpeg', costo: 100},
                {nombre: 'Hamburguesa', src: '@/assets/Hamburguesa.jpeg', costo: 100},
                {nombre: 'Hamburguesa', src: '@/assets/Hamburguesa.jpeg', costo: 100},
                {nombre: 'Hamburguesa', src: '@/assets/Hamburguesa.jpeg', costo: 100},
                {nombre: 'Hamburguesa', src: '@/assets/Hamburguesa.jpeg', costo: 100},
                {nombre: 'Hamburguesa', src: '@/assets/Hamburguesa.jpeg', costo: 100}
            ]
        }
    },
    methods: {
        getSrc(name) {
            return require('@/assets/${name}.jpeg')
        }
    }
}
</script>

<template>
<NavBar/>
<center><h1>Menu del Restaurante:</h1></center>
<form id="login-box" @submit="checkForm"> <!-- action="/something" method="post"> -->
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-6" v-for="card in cards">
            <center><h2>{{card.nombre}}</h2></center>
            <img class="img_menu" :src="card.src" alt='img'>
            <input type="button" class="carrito" value="Añadir al carrito: " />
            <h3>{{card.costo}}$</h3>
        </div>
    </div>
</div>
</form>

<Footer/>


</template>

<style scoped>
@import "@/assets/base.css";
#login-box {
  margin: auto;
  width: 50%;
  border: 3px solid black;
  padding: 20px;
}

.col-lg-6{
   /*set height*/
    height: 100%;
    width:49%;
    border:1px solid blue;
    margin-bottom:10px;
    float:left;
    margin-right:1%;
}

.img_menu{
    margin-top: 5%;
    width: 100%;
    height: 80%;
}

.carrito{
    background: url('@/assets/carrito-de-compras.png') left center no-repeat;
    background-size: 17%;
    padding-left: 30px;
    margin-bottom: 1%;
}

</style>
