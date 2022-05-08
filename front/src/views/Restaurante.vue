<script>
import { useAxios } from '../axios_common'
import NavBar from '../components/NavBar.vue';
import Footer from '../components/Footer.vue';


export default {
    components:{
    NavBar,
    Footer,
    NavBar,
    Footer
},
    data(){
        return {
            restaurante : {}
        };
    },
    props:[
        "idrestaurante"
    ],
    mounted(){
        const instance = useAxios()
        instance.get("restaurante/" + this.idrestaurante)
        .then((res)=>{
            console.log(res.data)
            this.restaurante = res.data
        })
        .catch((err)=> {
            console.log(err)
        });
    }

}

</script>
<template>
<NavBar/>

<h1>{{restaurante.nombre}}</h1>
<p>{{restaurante.calle}} {{restaurante.numero}} {{restaurante.estado}}, {{restaurante.municipio}}</p>
<a :href="'/menu/' + restaurante.idrestaurante + '/1'"> menu del restaurante</a>
<br>
<a :href="'/resenas/' + restaurante.idrestaurante ">resenas restaurante</a>
<Footer/>
</template>



<style>

</style>