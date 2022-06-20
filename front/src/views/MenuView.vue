<script>
import { useAxios } from "../axios_common";
import { useCarrito } from "../stores/carrito";
import { useStore as useAuthStore } from "../stores/auth";
import { useStore as useAdminStore } from "../stores/admin";
import roles from "../constants/roles";

const auth = useAuthStore();
const admin = useAdminStore();
export default {
  props: ["idrestaurante"],
  data() {
    return {
      addPlatilloForm: false,
      platilloNuevo: {
        nombre: "",
        costo: 0,
      },
      cards: [],
      showError: false,
    };
  },
  methods: {
    getSrc(name) {
      return require("@/assets/${name}.jpeg");
    },
    addPlatillo(platillo) {
      let carrito = useCarrito();
      if (
        carrito.cantidadPlatillos > 1 &&
        carrito.restaurante != this.idrestaurante
      ) {
        this.showError = true;
        return;
      }

      carrito.restaurante = this.idrestaurante;
      carrito.increase(platillo);
      this.$vaToast.init({
        message: `1 ${platillo.nombre} agregado al carrito`,
        color: "primary",
      });
    },
    postPlatillo() {
      const instance = useAxios();
      instance
        .post("menu/", {
          idrestaurante: this.idrestaurante,
          nombrePlatillo: this.platilloNuevo.nombre,
          costoPlatillo: this.platilloNuevo.costo,
        })
        .then((res) => {
          console.log("Se logro");
          console.log(JSON.stringify(res.data));
          this.getCards();
          this.addPlatilloForm = !this.addPlatilloForm;
        })
        .catch((err) => {
          console.log(err.response.data.error);
        });
    },
    checkAdmin() {
      // TODO Verificar que sea el restaurante que esta logueado
      return (
        auth.hasPermisionsOf(roles.ADMINISTRADOR) &&
        admin.isAdminOf(this.idrestaurante)
      );
    },
    async getCards() {
      const instance = useAxios();
      const ruta = "/menu/" + this.idrestaurante;
      instance
        .get(ruta, {
          params: {
            skip: 0,
            take: 10,
          },
        })
        .then((res) => {
          console.log("Funciono");
          this.cards = res.data;
        })
        .catch((err) => {
          console.log("aaaa");
          console.log(err.response.data.error);
        });
    },
    async removePlatillo(idplatillo){
      console.log("idplatillo a borrar", idplatillo);
      const instance = useAxios();
      instance.delete("menu/" + idplatillo)
      .then((res)=>{
        console.log("Borre el elemento con este id", res.data)
        this.getCards()
      })
      .catch((err)=>{
        console.log(err.response.data.error)

      })
    }
  },
  mounted() {
    this.getCards();
    const instance = useAxios();
    instance.get("/ordenes-cliente/carrito");
  },
};
</script>

<template>
  <div>
    <va-modal
      v-model="showError"
      message="No puedes seleccionar platillos de dos restaurantes distintos"
      title="Oops"
    />

    <va-button v-if="checkAdmin()" @click="addPlatilloForm = !addPlatilloForm">
      Agregar platillo.
    </va-button>

    <va-form v-if="addPlatilloForm" tag="form" @submit.prevent="postPlatillo">
      <va-input v-model="platilloNuevo.nombre" label="Nombre de platillo" />

      <va-input v-model="platilloNuevo.costo" label="Precio de platillo" />

      <va-button type="submit" class="mt-2">
        Agregar platillo al menu
      </va-button>
    </va-form>
    <form id="login-box" @submit="checkForm">
      <!-- action="/something" method="post"> -->
      <div class="container-fluid">
        <div class="row">
          <va-card
            v-for="card in cards"
            v-bind:key="card.idplatillo"
            class="col-lg-6"
          >
            <va-image
              :src="card.img"
              alt="comida sabrosa"
            />
            <va-card-title>{{ card.nombre }}</va-card-title>
            <va-card-content>${{ card.costo }} </va-card-content>
            <va-card-actions align="stretch" vertical>
              <va-button
              v-if="!checkAdmin" 
              @click="addPlatillo(card)">Agregar </va-button>
              <va-button 
              v-if="checkAdmin"
              @click="removePlatillo(card.idplatillo)"
              >
              Eliminar platillo
              </va-button>
            </va-card-actions>
          </va-card>
        </div>
      </div>
    </form>
  </div>
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
