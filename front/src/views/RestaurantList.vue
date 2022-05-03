<script>



import NavBar from "../components/NavBar.vue"
import Footer from "../components/Footer.vue"

import { useAxios } from "../axios_common";

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
            const instance = useAxios();
            instance
                .get("/restaurant", {
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
        },
    }
}
</script>


<template>

<ul>
    <li v-for="card in cards" v-bind:key="card.idrestaurante">
        <a :href="'/restaurant/'+card.idrestaurante">{{card.nombre}}</a>
    </li>
</ul>
</template>



<style>

</style>