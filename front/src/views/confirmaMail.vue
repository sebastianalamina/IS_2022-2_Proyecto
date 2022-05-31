<script setup>
import { useRoute } from "vue-router";
import { useAxios } from "../axios_common";
import { ref } from "vue";

const route = useRoute();
const axios = useAxios();

const verificado = ref(0);

async function verifica() {
  verificado.value = 0.5;
  await axios.get(`auth/verifica/${route.params.id}`);
  verificado.value = 1;
}
</script>
<template>
  <div class="row justify--center">
    <div class="flex md6 lg4">
      <va-inner-loading :loading="verificado > 0" v-if="verificado < 1">
        <va-card>
          <va-card-title>Verifica tu correo</va-card-title>
          <va-card-content>
            <va-button @click="verifica">Verificalo aqui</va-button>
          </va-card-content>
        </va-card>
      </va-inner-loading>
      <va-card v-else>
        <va-card-title>Tu correo ha sido verificado</va-card-title>
        <va-card-content>
          <h4 class="display-4">Muy bien</h4>
        </va-card-content>
      </va-card>
    </div>
  </div>
</template>
