<script>
import { useAxios } from "../axios_common";
import { useCarrito } from "../stores/carrito";

export default {
  props: ["idrestaurante", "idmenu"],
  components: {},
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
      console.log("este es el id del platillo", platillo.idplatillo);
      carrito.increase(platillo);
    },
  },
  mounted() {
    const instance = useAxios();
    console.log(this.idrestaurante);
    instance
      .get(`/menu/${this.idmenu}`)
      .then((res) => {
        console.log(res);
        this.cards = res.data;
      })
      .catch((err) => {
        console.log(err);
      });
  },
};
</script>

<template>
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
