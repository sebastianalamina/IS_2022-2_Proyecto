<script>
import { useAxios } from "../axios_common";
import { useStore as useAuthStore } from "../stores/auth";

export default {
  data() {
    return {
      username: null, // Nombre de usuario del form.
      password: null, // Contraseña del form.
      error_user: false,
      res_error: false,
    };
  },
  methods: {
    login(e) {
      e.preventDefault();
      if (!this.checkCienciasEmail(this.username)) return;
      const authStore = useAuthStore();
      const axios = useAxios();
      axios
        .post("/auth/login", {
          email: this.username,
          contrasegna: this.password,
        })
        .then((res) => {
          const token = res.data.token;
          const rol = res.data.rol;
          authStore.login(token, rol);
          this.$router.push("/");
        })
        .catch((e) => {
          if (e.response.data.message === "Invalid credentials")
            this.res_error = true;
        });
    },
    checkCienciasEmail(v) {
      this.error_user = !(v.indexOf("@ciencias.unam.mx") >= 0);
      return v.indexOf("@ciencias.unam.mx") >= 0;
    },
  },
};
</script>

<template>
  <va-card>
    <div class="row justify--center" style="margin: auto">
      <div>
        <va-form style="width: 300px" tag="form" @submit.prevent="login">
          <div style="color: red" v-if="res_error">
            Credenciales incorrectas
          </div>
          <va-input
            v-model="username"
            label="Usuario"
            :rules="[
              (v) =>
                checkCienciasEmail(v) ||
                `El correo tiene que ser de la facutlad de ciencias`,
            ]"
            :error="error_user"
          />
          <va-input
            class="mt-2"
            v-model="password"
            type="password"
            label="Contraseña"
          />
          <va-button
            type="submit"
            class="mt-2"
            :disabled="[error_user].reduce((a, b) => a || b, false)"
          >
            Login
          </va-button>
        </va-form>
        <va-button
          flat
          href="user-signup"
          style="margin-top: 15px; margin-bottom: 15px"
          color="info"
          class="mr-4"
          >Crea una cuenta</va-button
        >
      </div>
    </div>
  </va-card>
</template>
