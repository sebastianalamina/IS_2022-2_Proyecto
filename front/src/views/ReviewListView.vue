<script>
import { useAxios } from '../axios_common'
import Footer from '../components/Footer.vue'
import NavBar from '../components/NavBar.vue'
export default {
    components:{    
    NavBar,
    Footer
},
    props:[
        "idrestaurante",
    ],
    data(){
        return {
            resenas : [],
            enableForm : false,
            resenaNueva : {
              texto: null,
              calificacion : null
            },
            maxPagination: 0,
            pagActual : 0,
        }
    },
    methods:{
      showForm: function(e){
        console.log("hola")
        this.enableForm = true
      },
      getPage: function(skip){
        const instance = useAxios();
        const liga = "/resenas/" + this.idrestaurante
        instance.get(liga,
        {
            params:{
                skip,
                take: 10
            }
        })
        .then((res)=>{
            this.resenas = res.data
            console.log(res.data);
            console.log("lo logre")
        })
        .catch((err)=>{
            console.log(err);
        });

      },
      newPage: function(page){
        console.log("nueva pagina");
        this.pagActual = 10 * (page -1);
        this.getPage(this.pagActual);

      },
      publishReview : function(e){
        const date = new Date(Date.now()).toISOString();
        console.log("fecha actual : ",date)
        const instance = useAxios();
        instance.post("/resenas/",{
          texto : this.resenaNueva.texto,
          classificacion : this.resenaNueva.calificacion,
          idrestaurante : this.idrestaurante,
          idusuario : 2,
          date : date,
        })
        .then((res)=>{
          console.log("resena posteada");
          console.log("estos son los datos de la resena",res.data)
          this.resenas.unshift(res.data)
          this.resenas.pop()
          this.enableForm = false
        })
        .catch((err)=>{
          console.log(err)
        });
      }
    },

    mounted(){
        // Llama al backend para obtener la lista de resenas
        const instance = useAxios();
        const liga = "/resenas/" + this.idrestaurante
        instance.get(liga,
        {
            params:{
                skip:0,
                take: 10
            }
        })
        .then((res)=>{
            this.resenas = res.data
            console.log(res.data);
            console.log("lo logre")
        })
        .catch((err)=>{
            console.log(err);
        });
        console.log(this.$route.query.max)
        this.maxPagination = Math.ceil(parseInt(this.$route.query.max) / 10) 
    }

}
</script>

<template>
<NavBar/>

<div class="container pt-3 pb-3">
<h1>Resenas del restaurante {{this.resenas[0].restaurante.nombre}}</h1>

<div class="container">
  <button class="btn btn-primary" @click="this.showForm"> Anadir resena</button>
  <form v-if="this.enableForm" @submit.prevent="publishReview"> 
  <div class="form-group">
    <label for="exampleFormControlSelect1">Seleccione la cantidad de estrellas</label>
    <select class="form-control" id="resenaSelect" v-model="this.resenaNueva.calificacion">
      <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
      <option>5</option>
    </select>
  </div>
  
  <div class="form-group pb-3">
    <label for="exampleFormControlTextarea1">Resena : </label>
    <textarea class="form-control" id="resenaFormat" rows="3" v-model="this.resenaNueva.texto"></textarea>
  </div>

  <input class="btn btn-secondary" type="submit" value="publicar resena">
</form>
</div>

<div class="container pt-4">
<nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item" v-for="i in parseInt(this.maxPagination)" :key="i"><a class="page-link"  @click="this.getPage(i)">{{i}}</a></li> 
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
<div class="card" v-for="resena in resenas" :key="resena.idresena">
    <div class="card-body bt-3">
        <h4>Nombre del usuario: {{ resena.cliente.nombre + resena.cliente.amaterno + resena.cliente.apatermo}} </h4>
        Fecha de publicacion : {{resena.date}}
        <h5> Calificacion : {{resena.classificacion}}</h5>
       {{resena.texto}} 
    </div>
</div>
</div>
</div>

<Footer/>
</template>


<style>

</style>