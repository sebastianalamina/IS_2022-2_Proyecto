<script>
import { useAxios } from "../axios_common";
import Footer from "../components/Footer.vue";
import NavBar from "../components/NavBar.vue";
export default {
  components: {
    NavBar,
    Footer,
  },
  props: {
    idrestaurante: null,
    maxPagination: 0,
  },
  watch: {
    idrestaurante: function (newVal, oldVal) {
      const instance = useAxios();
      const liga = "/resenas/" + newVal;
      instance
        .get(liga, {
          params: {
            skip: 0,
            take: 10,
          },
        })
        .then((res) => {
          this.resenas = res.data;
          console.log(res.data);
          console.log("lo logre");
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
  data() {
    return {
      resenas: [],
      enableForm: false,
      resenaNueva: {
        texto: null,
        calificacion: null,
      },
      pagActual: 0,
    };
  },
  methods: {
    showForm: function (e) {
      this.enableForm = true;
    },
    getPage: function (skip) {
      const instance = useAxios();
      const liga = "/resenas/" + this.idrestaurante;
      instance
        .get(liga, {
          params: {
            skip,
            take: 10,
          },
        })
        .then((res) => {
          this.resenas = res.data;
          console.log(res.data);
          console.log("lo logre");
        })
        .catch((err) => {
          console.log(err);
        });
    },
    newPage: function (page) {
      console.log("nueva pagina");
      this.pagActual = 10 * (page - 1);
      this.getPage(this.pagActual);
    },
    publishReview: function (e) {
      const date = new Date(Date.now()).toISOString();
      console.log("fecha actual : ", date);
      const instance = useAxios();
      instance
        .post("/resenas/", {
          texto: this.resenaNueva.texto,
          classificacion: this.resenaNueva.calificacion,
          idrestaurante: this.idrestaurante,
          idusuario: 2,
          date: date,
        })
        .then((res) => {
          console.log("resena posteada");
          console.log("estos son los datos de la resena", res.data);
          this.resenas.unshift(res.data);
          this.resenas.pop();
          this.enableForm = false;
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },

  mounted() {
    // Llama al backend para obtener la lista de resenas
    const instance = useAxios();
    const liga = "/resenas/" + this.idrestaurante;
    instance
      .get(liga, {
        params: {
          skip: 0,
          take: 10,
        },
      })
      .then((res) => {
        this.resenas = res.data;
        console.log(res.data);
        console.log("lo logre");
      })
      .catch((err) => {
        console.log(err);
      });
  },
};
</script>

<template>
  <div class="container pt-3 pb-3">
    <div class="container">
      <va-button class="btn btn-primary" @click="this.showForm">
        Anadir resena
      </va-button>

      <div>
        <va-button
          @click="this.enableForm = !this.enableForm"
          v-if="this.enableForm"
        >
          Cancelar resena
        </va-button>
        <form v-if="this.enableForm" @submit.prevent="publishReview">
          <div class="form-group">
            <label for="exampleFormControlSelect1"
              >Seleccione la cantidad de estrellas</label
            >
            <select
              class="form-control"
              id="resenaSelect"
              v-model="this.resenaNueva.calificacion"
            >
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
            </select>
          </div>

          <div class="form-group pb-3">
            <label for="exampleFormControlTextarea1">Resena : </label>
            <textarea
              class="form-control"
              id="resenaFormat"
              rows="3"
              v-model="this.resenaNueva.texto"
            ></textarea>
          </div>

          <input
            class="btn btn-secondary"
            type="submit"
            value="publicar resena"
          />
        </form>
      </div>
    </div>

    <div>
      <va-list>
        <va-list-item v-for="resena in resenas" :key="resena.idresena">
          <va-list-item-section>
            <va-list-item-label>
              {{ resena.texto }}
            </va-list-item-label>
            <va-rating v-model="resena.classificacion" />
            <va-list-item-label caption>
              {{
                resena.cliente.usuario.nombre +
                resena.cliente.usuario.apatermo +
                resena.cliente.usuario.amaterno
              }}
            </va-list-item-label>
          </va-list-item-section>
        </va-list-item>
      </va-list>
    </div>
  </div>
</template>

<style></style>
