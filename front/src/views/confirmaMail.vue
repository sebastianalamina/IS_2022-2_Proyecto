<script setup>
import { useRoute, useRouter } from "vue-router";
import { useAxios } from "../axios_common";
import { ref } from "vue";

const route = useRoute();
const router = useRouter();
const axios = useAxios();

const verificado = ref(0);

async function verifica() {
  verificado.value = 0.5;
  
  try {  // <- Issue #45 del repo.
    await axios.get(`auth/verifica/${route.params.id}`);
  } catch (e) {
    if (e.meta.cause === "Record to update not found.")
      return res.status(404).send({ error: "registro no encontrado" });
  }
  
  verificado.value = 1;
  setTimeout(() => router.push("/"), 1000);
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
