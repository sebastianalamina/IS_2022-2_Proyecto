<script setup>
import { ref } from "@vue/reactivity";
import { useAxios } from "../../axios_common";

const lugar = ref("");
const numOrden = ref("");
const masDisponibles = ref(true);
const error = ref("");

const axios = useAxios();

let skip = 0;

async function aceptar() {
  await axios.get(`/orden/${numOrden.value}/aceptar`);
  //TODO: enviar al usuario a página informativa
}
function rechazar() {
  skip++;
  fetch();
}
async function risky_fetch() {
  const res = await axios.get("/orden/disponibles", { params: { skip } });
  numOrden.value = res.data.orden.idorden;
  return res;
}
async function fetch() {
  try {
    await risky_fetch();
  } catch (e) {
    masDisponibles.value = false;
    error.value = e.response.data?.error;
  }
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
        <va-card-title>Vuelve a intentarlo en unos minutos</va-card-title>
        <va-card-content class="negative">
          <h5 class="display-5">{{ error }}</h5>
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
