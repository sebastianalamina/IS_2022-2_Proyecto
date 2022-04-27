<script>
import NavBar from "../components/NavBar.vue";
import Footer from "../components/Footer.vue";
import { useAxios } from "../axios_common";
import { useCarrito } from "../stores/carrito";


export default {
  props: ["idrestaurante", "idmenu"],
  components: {
    NavBar,
    Footer,
  },
  data() {
    return {
      cards: [],
    };
  },
  methods: {
    getSrc(name) {
      return require("@/assets/${name}.jpeg");
    },
    addPlatillo(platillo) {
      let carrito = useCarrito();
      carrito.increase(platillo);
    },

  },
  mounted() {
    const instance = useAxios();
    console.log(this.idrestaurante);
    instance
      .get("/menu/", {
        params: {
          id_menu: this.idmenu,
          id_restaurante: this.idrestaurante,
        },
      })
      .then((res) => {
        this.cards = res.data;
      })
      .catch((err) => {
        console.log(err);
      });
  },
};
</script>

<template>
  <NavBar />
  <h1>Menu del Restaurante:</h1>
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

  <Footer />
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
