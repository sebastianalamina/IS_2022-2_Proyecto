<script>
import { useAxios } from "../axios_common";
import { useStore as useAuthStore } from "../stores/auth";
import roles from "../constants/roles";

export default {
  data() {
    return {
      errors: [],
      correo: null,
      password: null,
      passwordConf: null,
      rol: "cliente",
      nombre: null,
      estado: null,
      calle: null,
      numero: null,
      cp: null,
      municipio: null,
      options: [roles.CLIENTE, roles.ADMINISTRADOR, roles.REPARTIDOR],
      res_error: false,
    };
  },
  methods: {
    register: function (e) {
      // Evita que se recargue la página.
      e.preventDefault();
      //const authStore = useAuthStore();
      const axios = useAxios();
      if (!this.$refs.form.validate()) return;
      axios
        .post("/auth/register", {
          email: this.correo,
          contrasegna: this.password,
          rol: this.rol,
          nombre: this.nombre,
          estado: this.estado,
          calle: this.calle,
          numero: this.numero,
          cp: this.cp,
          municipio: this.municipio,
        })
        .then((res) => this.$router.push("/login"))
        .catch((error) => (this.res_error = true));
    },
  },
};
</script>

<template>
  <div class="mitad izquierda">
    <va-form
      ref="form"
      style="width: 300px"
      tag="form"
      @submit.prevent="register"
      id="signup-box"
    >
      <div style="color: red" v-if="res_error">Algo salio mal</div>
      <va-input
        v-model="correo"
        :rules="[
          (v) =>
            v.indexOf('@ciencias.unam.mx') >= 0 ||
            `El correo tiene que ser de la facutlad de ciencias`,
        ]"
        label="Correo de ciencias"
        input-class="va-input-style"
        @validation="validation = $event"
      />
      <va-input
        v-model="password"
        label="contraseña"
        type="password"
        input-class="va-input-style"
        :rules="[(v) => v.length > 0 || 'Por favor llena este campo']"
      />
      <va-input
        v-model="passwordConf"
        label="Confirma tu contraseña"
        type="password"
        input-class="va-input-style"
        :rules="[
          (v) => v === password || `La contraseñas tienen que coincidir`,
        ]"
        @validation="validation = $event"
      />
      <va-input
        v-model="nombre"
        label="Nombre"
        input-class="va-input-style"
        :rules="[(v) => !!v || 'Por favor llena este campo']"
      />
      <va-input
        v-model="estado"
        label="estado"
        input-class="va-input-style"
        :rules="[(v) => !!v || 'Por favor llena este campo']"
      />
      <va-input
        v-model="calle"
        label="calle"
        input-class="va-input-style"
        :rules="[(v) => !!v || 'Por favor llena este campo']"
      />
      <va-input
        v-model="numero"
        label="número"
        input-class="va-input-style"
        :rules="[(v) => !!v || 'Por favor llena este campo']"
      />
      <va-input
        v-model="cp"
        label="cp"
        input-class="va-input-style"
        :rules="[(v) => !!v || 'Por favor llena este campo']"
      />
      <va-input
        v-model="municipio"
        label="municipio"
        input-class="va-input-style"
        :rules="[(v) => !!v || 'Por favor llena este campo']"
      />
      <va-select v-model="rol" :options="options" />
      <va-button type="submit" class="mt-2"> Register </va-button>
    </va-form>
  </div>
</template>

<style>
#signup-box {
  margin: auto;
  padding-top: 10%;
  width: 35%;
}
.va-input {
  margin: 5px;
}
</style>
