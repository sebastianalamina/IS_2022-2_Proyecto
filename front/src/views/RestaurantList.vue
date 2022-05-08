<script>
import { useAxios } from "../axios_common";

import NavBar from "../components/NavBar.vue";
import Footer from "../components/Footer.vue";

export default {
    components: {
    NavBar,
    Footer, 
},
    data() {
        return {
            cards: [],
        };
    },
    methods:{
        getRestaurantList(){
            
        },
    },
    mounted(){
        const instance = useAxios();
        instance.get("/restaurante", {
                params: {
                    skip: 0,
                    take: 10
                },
            })
            .then((res) => {
                this.cards = res.data;
            })
            .catch((err) => {
                console.log(err);
            });
    }
}
</script>


<template>
<NavBar/>
<ul>
    <li v-for="card in cards" v-bind:key="card.idrestaurante">
        <a :href="'/restaurante/'+card.idrestaurante">{{card.nombre}}</a>
    </li>
</ul>

<Footer/>
</template>



<style>

</style>