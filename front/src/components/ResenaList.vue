<script>
import { useAxios } from "../axios_common";
import roles from "../constants/roles";
import { useStore as useAuthStore } from "../stores/auth";

const auth = useAuthStore();

export default { 
  props: {
    idrestaurante: null,
    maxPagination: 0,
    isCliente : false
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
        calificacion: '1',
      },
      pagActual: 0,
      options: ['1','2','3','4','5']
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
    publishReview: function () {
      console.log("posteando resena")
      const date = new Date(Date.now()).toISOString();
      console.log("fecha actual : ", date);
      const instance = useAxios();
      instance
        .post("/resenas/", {
          texto: this.resenaNueva.texto,
          classificacion: this.resenaNueva.calificacion,
          idrestaurante: this.idrestaurante,
          date: date,
        })
        .then((res) => {
          console.log("resena posteada");
          console.log("estos son los datos de la resena", res.data);
          this.resenas.unshift(res.data);
          this.resenas.pop();
          this.enableForm = false;
          this.$vaToast.init({
            message: `Resena posteada `,
            color: "primary",
          });
          this.resenaNueva.texto = null;
          this.resenaNueva.calificacion = '1';
        })
        .catch((err) => {
          console.log("Resena fallo su posteo")
          console.log(err);
        });
    },
  },

  mounted() {
    // Llama al backend para obtener la lista de resenas
    const auth = useAuthStore();
    this.esCliente = auth.hasPermisionsOf(roles.CLIENTE);
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
      <va-button
      class="btn btn-primary"
      @click="this.showForm"
      v-if="isCliente">
        Anadir resena
      </va-button>

      <div>
        <va-button
          @click="this.enableForm = !this.enableForm"
          v-if="this.enableForm"
        >
          Cancelar resena
        </va-button>
        <va-form
          v-if="this.enableForm" 
          @submit.prevent="publishReview"
        >
          <va-input
            class="mb-4" 
            type="textarea"
            label="Resena"
            v-model="resenaNueva.texto"
          />
         
          <va-select
         v-model="resenaNueva.calificacion" 
         :options="options"
          />

         <va-button class="mt-2" @click="publishReview">
        Publicar resena 
      </va-button> 
        </va-form>
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
                resena.cliente.usuario.apatermo 
              }}
            </va-list-item-label>
          </va-list-item-section>
        </va-list-item>
      </va-list>
    </div>

    
  </div>

</template>

<style></style>
