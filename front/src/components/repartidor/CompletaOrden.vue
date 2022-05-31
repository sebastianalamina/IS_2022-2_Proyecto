<script setup>
import { ref } from "@vue/reactivity";
import { useAxios } from "../../axios_common";

const showModal = ref(false);
const lugar = ref("");
const numOrden = ref("");
const ixEstadoOrden = ref(0);

const axios = useAxios();

// enviar si es aceptada

const preparando = {
  title: "Marca en camino cuando recibas la orden",
  confirmMessage:
    "Estas seguro de que quieres marcar la orden como 'en camino' ",
  btnMessage: "En camino",
};
const enCamino = {
  title: "Marca en como entregada cuando el cliente teng la orden orden",
  confirmMessage:
    "Estas seguro de que quieres marcar la orden como 'entregada' ",
  btnMessage: "Entregada",
};
const estadoOrden = [preparando, enCamino];

async function aceptar() {
  let estado;
  if (ixEstadoOrden.value == 0) estado = "EN_CAMINO";
  else if (ixEstadoOrden.value == 1) estado = "ENTREGADA";
  else return;
  await axios.post(`/orden/${numOrden.value}/estado`, { estado });
  ixEstadoOrden.value += 1;
}

async function load() {
  const { data } = await axios.get("orden/pendiente");
  if (data == null) {
    ixEstadoOrden.value = 2;
    return;
  }
  if (data.orden.estado === "RECIBIDA" || data.orden.estado === "RECIBIDA")
    ixEstadoOrden.value = 0;
  else if (data.orden.estado === "EN_CAMINO") ixEstadoOrden.value = 1;
  numOrden.value = data.idorden;
}

load();
</script>
<template>
  <div class="row justify--center negative-top">
    <div class="flex">
      <va-card stripe stripe-color="success" v-if="ixEstadoOrden < 2">
        <va-card-title>{{ estadoOrden[ixEstadoOrden].title }}</va-card-title>
        <va-card-content class="negative">
          <h5 class="display-5">Orden: {{ numOrden }}</h5>
          Dirección restaurante: {{ lugar }}
        </va-card-content>
        <va-card-actions>
          <va-button @click="showModal = true">{{
            estadoOrden[ixEstadoOrden].btnMessage
          }}</va-button>
        </va-card-actions>
        <va-modal
          v-model="showModal"
          cancel-text="cancelar"
          :message="estadoOrden[ixEstadoOrden].confirmMessage"
          title="Confirma si estas listo"
          @ok="aceptar"
        />
      </va-card>
      <va-card stripe stripe-color="success" v-else>
        <va-card-content class="negative">
          <h5 class="display-5">Completaste las ordenes pendientes</h5>
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
