<script>
import { useAxios } from "../axios_common";

import NavBar from "../components/NavBar.vue";
import Footer from "../components/Footer.vue";
import ResenaList from "../components/ResenaList.vue";

export default {
    components: {
    NavBar,
    Footer,
    ResenaList,
},
    data() {
        return {
            cards: [],
            restauranteSeleccionadoId : 1,
            restauranteSelecionadoMax: 10,
            mostrarResenas: 0,
            skip : 0
        };
    },
    methods:{
        getRestaurantList: function(skip){
            const instance  = useAxios();
            instance.get("/restaurante",{
                params:{
                    skip : skip,
                    take : 10
                },
            })
            .then((res)=>{
                this.cards = res.data;
                console.log("cards de restaurantes cargadas");
            })
            .catch((err)=>{
                console.log(err);
            })
            
        },
        selectRestaurante: function(id){
            this.restauranteSeleccionadoId = id;
            this.mostrarResenas += 1;
            console.log("viendo la resena de :", id)
        },
        nextPage : function(){
            this.skip += 10;
            this.getRestaurantList(this.skip);
            console.log("pase a la siguiente",JSON.stringify(this.cards[0]))
            this.mostrarResenas += 1;
        },
        previousPage : function(){
            if(this.skip === 0){
                return
            }
            this.skip -= 10;
            this.getRestaurantList(this.skip);
            console.log(JSON.stringify("pase al de atras",this.cards[0]))
            this.mostrarResenas += 1;
        },
    },
    mounted(){
        this.getRestaurantList(this.skip);
        console.log("lool");
    }
}
</script>


<template>
<NavBar/>
<button @click="this.previousPage">Pagina anterior</button>
<button @click="this.nextPage">Siguiente pagina</button>
<div>
<div v-for="card of cards" :key="card.idrestaurante">
<p> {{card.nombre}}</p>
<button @click.prevent="this.selectRestaurante(card.idrestaurante)">Ver resena</button>
<a :href=" '/menu/' + card.idrestaurante + '/1' " >Ver menu</a>
</div> 
</div>

<div>

    <h3>Resenas</h3>
</div>
<ResenaList
:idrestaurante="this.restauranteSeleccionadoId"
:key="this.mostrarResenas"
/>
<Footer/>
</template>



<style>

</style>