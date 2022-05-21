<script setup>
import { ref } from "@vue/reactivity";
import { useAxios } from "../../axios_common";

const lugar = ref("");
const numOrden = ref("");
const masDisponibles = ref(true);

const axios = useAxios();

let skip = 0;

async function aceptar() {
  console.log(await axios.get("/orden/2/aceptar"));
}
function rechazar() {
  skip++;
  fetch();
}
async function fetch() {
  const res = await axios.get("/orden/disponibles", { params: { skip } });
  if (res.data.orden == null) {
    masDisponibles.value = false;
    return;
  }
  numOrden.value = res.data.orden.idorden;
}
fetch();
</script>

<template>
  <div class="row justify--center negative-top">
    <div class="flex">
      <va-card stripe stripe-color="success" v-if="masDisponibles">
        <va-card-title>Aceptar Orden?</va-card-title>
        <va-card-content class="negative">
          <h5 class="display-5">Orden: {{ numOrden }}</h5>
          Dirección restaurante: {{ lugar }}
        </va-card-content>
        <va-card-actions align="between">
          <va-button @click="rechazar">Rechazar</va-button>
          <va-button @click="aceptar">Aceptar</va-button>
        </va-card-actions>
      </va-card>
      <va-card stripe stripe-color="secondary" v-else>
        <va-card-title>No hay mas ordenes disponibles</va-card-title>
        <va-card-content class="negative">
          <h5 class="display-5">Vuelve a intentarlo en unos minutos</h5>
        </va-card-content>
      </va-card>
    </div>
  </div>
</template>

<style scoped>
.negative-top {
  margin-top: 10vh;
}
.negative {
  padding-top: 5vh;
  padding-bottom: 5vh;
  padding-left: 10vw;
  padding-right: 10vw;
}
</style>
