<script>
import NavBar from "../components/NavBar.vue";
import Footer from "../components/Footer.vue";
import { useAxios } from "../axios_common";

export default {
  data() {
    return {
      ordenes: [],
    };
  },
  methods: {
    async getOrdenes() {
      const instance = useAxios();
      instance
        .get("/ordenes-cliente/ordenes")
        .then((res) => {
          this.ordenes = res.data;
        })
        .catch((err) => {
          console.log(err.response.data.error);
        });
    },
    removeOrden(idorden) {
      const instance = useAxios();
      const ruta = "/ordenes-cliente/deleteorden/" + idorden;
      instance.delete(ruta).then((res) => {
        this.getOrdenes();
      });
    }
  },
  mounted() {
    this.getOrdenes();
  },
};
</script>

<template>
  <div class="contenedor-ordenes">
    <div class="header">
      <h3 class="titulo">Tus órdenes</h3>
    </div>
    <div class="orden" v-for="orden in ordenes" v-bind:key="orden">
      <div class="informacion">
        <div class="id-contenedor">
          <h1 class="id">ID de orden: {{ orden.idorden }}</h1>
        </div>
        <div class="costo-contenedor">
          <h3 class="costo">Total: ${{ orden.costo }}</h3>
        </div>
      </div>
      <div class="contenido">
        <div class="item" v-for="item in orden.items" v-bind:key="item">
          {{ item.nombre }}
        </div>
        <div class="miniaturas" v-for="item in orden.items" v-bind:key="item">
          <img class="imagen-item" v-bind:src="item.src" />
        </div>
      </div>
      <div class="ver">
        <va-chip
          ><router-link :to="`/view-order-status/${orden.idorden}`"
            >Ver estado</router-link
          ></va-chip
        >
        <va-button 
            @click="removeOrden(orden.idorden)">
             Eliminar orden
        </va-button>
      </div>
    </div>
  </div>
</template>

<style scoped>
.contenedor-ordenes {
  margin: 0 auto;
  margin-top: 10px;
  height: 80%;
  width: 80%;
  border-radius: 20px;
  border: 3px solid black;
  display: flex;
  justify-content: center;
  flex-direction: column;
}

.header {
  margin: 3px;
  margin-left: 10px;
  display: flex;
  justify-content: center;
}

.titulo {
  margin: 5px;
  font-size: 30px;
  font-weight: 700;
}

.orden {
  margin: auto;
  margin-bottom: 3px;
  border: 2px solid gray;
  width: 90%;
  height: 40%;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.informacion {
  width: 20%;
}

.imagen-item {
  height: 30px;
}

.id-contenedor {
  margin: 5px;
}

.costo-contenedor {
  margin: 5px;
}

.id {
  font-size: 30px;
}

.costo {
  font-size: 20px;
}

.contenido {
  width: 50%;
  display: table-column;
  justify-content: left;
}

.miniaturas {
  display: inline-block;
  margin: 1px;
  position: relative;
}

.ver {
  margin-right: 20px;
}
</style>
