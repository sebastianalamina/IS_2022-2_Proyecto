<script>
import { useAxios } from "../axios_common";
import { useCarrito } from "../stores/carrito";
import { useStore as useAuthStore} from "../stores/auth";
import roles from "../constants/roles";

const auth = useAuthStore();
export default {
  props: ["idrestaurante"], 
  data() {
    return {
      addPlatilloForm : false,
      platilloNuevo : {
        nombre : "",
        costo : 0,
      },
      cards: [],
    };
  },
  methods: {
    getSrc(name) {
      return require("@/assets/${name}.jpeg");
    },
    addPlatillo(platillo) {
      let carrito = useCarrito();
      console.log("este es el id del platillo", platillo.idplatillo);
      carrito.increase(platillo);
    },
    postPlatillo(){
      const instance = useAxios();
      instance.post("menu/", 
      {
        idrestaurante : this.idrestaurante,
        nombrePlatillo : this.platilloNuevo.nombre,
        costoPlatillo : this.platilloNuevo.costo, 
      })
      .then((res)=>{
        console.log("Se logro")
        console.log(JSON.stringify(res.data));
        this.getCards();
        this.addPlatilloForm = !this.addPlatilloForm;
      })
      .catch((err)=>{
        console.log(err.response.data.error)
      });

    },
    checkAdmin(){
      // TODO Verificar que sea el restaurante que esta logueado
      ``
      return auth.hasPermisionsOf(roles.ADMINISTRADOR);
    },
    async getCards(){
      const instance = useAxios();
      console.log(this.idrestaurante);
      const ruta = "/menu/" + this.idrestaurante;
      instance
        .get(ruta, {
          params: {
            skip: 0,
            take: 10,
          },
        })
        .then((res) => {
          console.log("Funciono")
          this.cards = res.data;
        })
        .catch((err) => {
          console.log("aaaa")
          console.log(err.response.data.error);
        });
    },
  },
  mounted() {
    this.getCards();
  },
};
</script>

<template>
  <h1>Menu del Restaurante:</h1>

  <va-button 
  v-if="checkAdmin"
  @click="addPlatilloForm = !addPlatilloForm" 
  >
  Agregar platillo.
  </va-button>

  <va-form
  v-if="addPlatilloForm" 
  tag="form"
  @submit.prevent="postPlatillo"
  >
    <va-input
    v-model="platilloNuevo.nombre"
    label="Nombre de platillo"
    />

    <va-input
    v-model="platilloNuevo.costo" 
    label="Precio de platillo"
    />

    <va-button
    type="submit" 
    class="mt-2"
    >
    Agregar platillo al menu
    </va-button>
  </va-form>
  <form id="login-box" @submit="checkForm">
    <!-- action="/something" method="post"> -->
    <div class="container-fluid">
      <div class="row">
        <div
          class="col-lg-6"
          v-for="card in cards"
          v-bind:key="card.idplatillo"
        >
          <h2>{{ card.nombre }}</h2>
          <p>{{ card.idplatillo }}</p>
          <img class="img_menu" :src="card.src" alt="imagen nos disponible" />
          <input
            type="button"
            class="carrito"
            value="Añadir al carrito: "
            @click="addPlatillo(card)"
          />

          <h3>${{ card.costo }}</h3>
        </div>
      </div>
    </div>
  </form>
</template>

<style scoped>
@import "@/assets/base.css";
#login-box {
  margin: auto;
  width: 50%;
  border: 3px solid black;
  padding: 20px;
}

.col-lg-6 {
  /*set height*/
  height: 100%;
  width: 49%;
  border: 1px solid blue;
  margin-bottom: 10px;
  float: left;
  margin-right: 1%;
}

.img_menu {
  margin-top: 5%;
  width: 100%;
  height: 80%;
}

.carrito {
  background: url("@/assets/carrito-de-compras.png") left center no-repeat;
  background-size: 17%;
  padding-left: 30px;
  margin-bottom: 1%;
}
</style>

