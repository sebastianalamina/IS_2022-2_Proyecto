<script>
import { useAxios } from "../axios_common";
import ResenaList from "../components/ResenaList.vue";
import { useStore as useAuthStore } from "../stores/auth";
import roles from "../constants/roles";

const auth = useAuthStore()


export default {
  components: {
    ResenaList,
  },
  data() {
    return {
      cards: [],
      restauranteSeleccionadoId: 1,
      restauranteSelecionadoMax: 10,
      mostrarResenas: 0,
      skip: 0,
      listaKey: 0,
      esCliente: false,
    };
  },
  methods: {
    getRestaurantList: function (skip) {
      const instance = useAxios();
      instance
        .get("/restaurante", {
          params: {
            skip: skip,
            take: 10,
          },
        })
        .then((res) => {
          this.cards = res.data;
          console.log("cards de restaurantes cargadas");
          console.log(
            "lo que cargue de restaurantes : ",
            JSON.stringify(res.data)
          );
        })
        .catch((err) => {
          console.log(err.response.data.error);
        });
    },
    selectRestaurante: function (id) {
      this.restauranteSeleccionadoId = id;
      this.mostrarResenas += 1;
      console.log("viendo la resena de :", id);
    },
    nextPage: function () {
      this.skip += 10;
      this.getRestaurantList(this.skip);
      console.log("pase a la siguiente", JSON.stringify(this.cards[0]));
      this.mostrarResenas += 1;
      this.restauranteSeleccionadoId = null;
    },
    previousPage: function () {
      if (this.skip === 0) {
        return;
      }
      this.skip -= 10;
      this.getRestaurantList(this.skip);
      console.log(JSON.stringify("pase al de atras", this.cards[0]));
      this.mostrarResenas += 1;
    },
    isCliente(){
    return auth.rol == roles.CLIENTE
    }
  },
  mounted() {
    this.getRestaurantList(this.skip); 
    console.log("es cliente ? l", this.isCliente())
  }, 
};
</script>

<template>
  <div style="width: 100%; display: table">
    <div style="display: table-row">
      <div style="width: 600px; display: table-cell">
        <button @click="this.previousPage">Pagina anterior</button>
        <button @click="this.nextPage">Siguiente pagina</button>
        <div>
          <va-list :key="listaKey">
            <va-list-label> Restaurantes </va-list-label>

            <va-list-item
              v-for="restaurante in cards"
              :key="restaurante.restauranteid"
            >
              <va-list-item-section>
                <va-list-item-label>
                  {{ restaurante.nombre }}
                </va-list-item-label>
                <va-list-item-label caption>
                  {{ restaurante.calle + restaurante.estado }}
                </va-list-item-label>
              </va-list-item-section>

              <va-list-item-section icon>
                <va-button
                  @click="selectRestaurante(restaurante.idrestaurante)"
                >
                  Ver resenas
                </va-button>
                <va-button
                  @click="
                this.$router.push({
                  path: '/menu/' + restaurante.idrestaurante,
                })
              "
                >
                  ver Menu
                </va-button>
              </va-list-item-section>
            </va-list-item>
          </va-list>
        </div>
      </div>
      <div style="display: table-cell">
        <div>
          <div>
            <h3>Resenas</h3>
            <ResenaList
              :idrestaurante="restauranteSeleccionadoId"
              :maxPagination="restauranteSelecionadoMax"
              :isCliente="isCliente()"
              v-bind:key="mostrarResenas"
              v-if="restauranteSeleccionadoId"
            />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style></style>