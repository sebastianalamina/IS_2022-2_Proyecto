<script>
import { useAxios } from "../axios_common";
import { useCarrito } from "../stores/carrito";
import { mapStores } from "pinia";
import humanize from "humanize-number";

export default {
  components: {},
  data() {
    return {
      cards: [],
    };
  },
  computed: {
    ...mapStores(useCarrito),
  },
  methods: {
    humanize,
    confirmar(total) {
      if(this.carritoStore.platillosArray.length == 0) {
        this.$vaToast.init({
          message: 'Error: Carrito vacío',
          color: "red",
        });
        return;
      }
      this.$vaToast.init({
        message: `Orden pedida`,
        color: "primary",
      });
      const instance = useAxios();
      instance.get("/ordenes-cliente/carrito").then((res) => {
        const ruta =
          "/ordenes-cliente/confirmar/" + res.data.idorden + "/" + total;
        instance.put(ruta);
      });

      this.carritoStore.clean();

      instance.post("/ordenes-cliente/newcart");
    },
    aumenta(platillo) {
      this.carritoStore.increase(platillo);
    },
    disminuye(platillo) {
      const instance = useAxios();
      instance.get("/ordenes-cliente/carrito").then((res) => {
        const ruta1 =
          "/ordenes-cliente/contenidoorden/" +
          res.data.idorden +
          "/" +
          platillo.idplatillo;
        instance.get(ruta1).then((res) => {
          const ruta2 =
            "/ordenes-cliente/deletedish/" + res.data.idcontenidoorden;
          instance.delete(ruta2);
        });
      });
      this.carritoStore.decrease(platillo);
    },
    elimina(platillo) {
      this.carritoStore.remove(platillo);
    },
    eliminaTodo() {
      const instance = useAxios();
      console.log("obteniendo carrito");

      instance.get("/ordenes-cliente/carrito").then((res) => {
        const ruta = "/ordenes-cliente/deletecontenido/" + res.data.idorden;
        instance.delete(ruta);
      });
      this.carritoStore.clean();
    },
    calculaTotal() {
      this.carritoStore.platillosArray;
    },
    async getCards() {
      console.log("obteniendo cards");
      const instance = useAxios();
      instance.get("ordenes-cliente/carrito").then((res) => {
        console.log("carrito obtenido");
        console.log(res.data);
        if (!res.data) return;
        const ruta = "/ordenes-cliente/platillos/" + res.data.idorden;
        instance
          .get(ruta)
          .then((res) => {
            console.log("contenido del carrito obtenido");
            console.log(res.data);
            this.cards = res.data;
          })
          .catch((err) => {
            console.log("error en mounted");
            console.log(err);
          });
      });
    },
  },
  mounted() {
    this.getCards();
  },
};
</script>

<template>
  <div class="contenedor-carrito">
    <div class="cabecera">
      <h3 class="titulo">Tu carrito</h3>
      <button class="b-eliminar-todo" @click="eliminaTodo()">
        Eliminar todo
      </button>
    </div>
    <div
      class="item-carrito"
      v-for="card in this.carritoStore.platillosArray"
      v-bind:key="card.nombre"
    >
      <div class="informacion">
        <h1 class="item-nombre">{{ card.nombre }}</h1>
      </div>
      <div class="contador"></div>
      <button class="b-contador" @click="disminuye(card)">-</button>
      <div class="count">{{ card.cantidad }}</div>
      <button class="b-contador" @click="aumenta(card)">+</button>
      <div class="precios">
        <div class="cantidad">${{ humanize(card.costo) }}</div>
        <button class="b-elimina-item" @click="elimina(card)">Elimina</button>
      </div>
    </div>
    <div>
      <p>Consumo total: ${{ humanize(this.carritoStore.totalPagar) }}</p>
    </div>
    <div class="confirmar">
      <button
        class="b-confirmar"
        @click="confirmar(this.carritoStore.totalPagar)"
      >
        Confirmar
      </button>
    </div>
  </div>
</template>

<style scoped>
.contenedor-carrito {
  margin: 0 auto;
  margin-top: 10px;
  width: 80%;
  height: 85%;
  border-radius: 20px;
  border: 3px solid black;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

.cabecera {
  margin: 3px;
  width: 90%;
  height: 15%;
  border: 1px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.titulo {
  margin: 2px;
  font-size: 25px;
  font-weight: 500;
}

.b-eliminar-todo {
  margin: 2px;
  font-size: 15px;
  font-weight: 400;
  color: rgb(143, 8, 8);
}

.item-carrito {
  margin: auto;
  width: 90%;
  height: 30%;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.conenedor-img {
  width: 15%;
  text-align: center;
}

.imagen-item {
  height: 100px;
  margin: 5px;
}

.informacion {
  height: 100%;
}

.item-nombre {
  padding-top: 2px;

  font-size: 28px;
}

.item-info {
  line-height: 30px;
  font-size: 15px;
}

.contador {
  width: 15%;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.b-contador {
  width: 40px;
  height: 40px;
  background-color: #d9d9d9;
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 50%;
  cursor: pointer;
  font-size: 20px;
}

.count {
  font-size: 20px;
}

.precios {
  height: 100%;
  text-align: right;
}

.cantidad {
  font-size: 20px;
}

.confirmar {
  margin: 5px;
}
</style>
