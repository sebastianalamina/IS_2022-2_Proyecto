<script>
import { useAxios } from "../axios_common";

export default {
  data() {
    return {
      restaurante: {},
      maxPages: 0,
    };
  },
  props: ["idrestaurante"],
  mounted() {
    const instance = useAxios();
    instance
      .get("restaurante/" + this.idrestaurante)
      .then((res) => {
        console.log(res.data);
        this.restaurante = res.data;
        this.maxPages = res.data._count.resena;
      })
      .catch((err) => {
        console.log(err);
      });
  },
};
</script>
<template>
  <div>
    <h1>{{ restaurante.nombre }}</h1>
    <p>
      {{ restaurante.calle }} {{ restaurante.numero }} {{ restaurante.estado }},
      {{ restaurante.municipio }}
    </p>
    <router-link :to="'/menu/' + restaurante.idrestaurante + '/1'">
      menu del restaurante</router-link
    >
    <br />

    <router-link
      :to="{
        path: '/resenas/' + restaurante.idrestaurante,
        query: { max: this.maxPages },
      }"
    >
      Resenas
    </router-link>
  </div>
</template>

<style></style>
