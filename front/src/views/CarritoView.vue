<script>
import NavBar from "../components/NavBar.vue";
import Footer from "../components/Footer.vue";
import { useCarrito } from "../stores/carrito";
import { mapStores } from "pinia";

export default {
  data() {
    return {};
  },
  computed: {
    ...mapStores(useCarrito),
  },
  mounted() {
    this.cards = this.carritoStore.platillosArray;
  },
  methods: {
    aumenta(platillo) {
      this.carritoStore.increase(platillo);
    },
    disminuye(platillo) {
      this.carritoStore.decrease(platillo);
    },
    elimina(platillo) {
      this.carritoStore.remove(platillo);
    },
    eliminaTodo() {
      this.carritoStore.clean();
    },
  },
};
</script>

<template>
  <NavBar />
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
      <div class="contenedor-img">
        <img class="imagen-item" :src="card.src" />
      </div>
      <div class="informacion">
        <h1 class="item-nombre">{{ card.nombre }}</h1>
        <h3 class="item-info">Más información</h3>
      </div>
      <div class="contador"></div>
      <button class="b-contador" @click="disminuye(card)">-</button>
      <div class="count">{{ card.cantidad }}</div>
      <button class="b-contador" @click="aumenta(card)">+</button>
      <div class="precios">
        <div class="cantidad">${{ card.costo }}</div>
        <button class="b-elimina-item" @click="elimina(card)">Elimina</button>
      </div>
    </div>
    <div class="confirmar">
      <button class="b-confirmar">Confirmar</button>
    </div>
  </div>
  <Footer />
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
  line-height: 10px;
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
