<script>
import { useAxios } from "../axios_common";
import { useStore as useAuthStore } from "../stores/auth";
import { useCarrito } from "../stores/carrito";
import roles from "../constants/roles";

export default {
  data() {
    return {
      username: null, // Nombre de usuario del form.
      password: null, // Contraseña del form.
      error_user: false,
      res_error: false,
      error_mesero: false,
    };
  },
  methods: {
    async login(e) {
      e.preventDefault();
      if (!this.checkCienciasEmail(this.username)) return;
      const authStore = useAuthStore();
      const carrito = useCarrito();
      const axios = useAxios();

      // Reset de errores.
      this.res_error = false;
      this.error_mesero = false;

      // Si es un mesero, comprobamos primero si ya fue
      // registrado por algún administrador. Si no, no
      // se loggea...

      try { // <- Issue #45 del repo.
        await axios
          .get("/mesero", {
            params: {
              email: this.username,
            }
          })
          .then((res) => {
            if (res.data) // Si es un mesero aún no registrado por algún administrador.
              this.res_error = true;
          })
          .catch((e) => {
            // console.log(e);
          });
      } catch (e) {
        // console.log(e);
      }

      if (this.res_error) {
        console.log("Mesero aún no registrado por algún administrador.");
        this.error_mesero = true;
        return;
      }

      axios
        .post("/auth/login", {
          email: this.username,
          contrasegna: this.password,
        })
        .then((res) => {
          const token = res.data.token;
          const rol = res.data.rol;
          carrito.clean();
          authStore.login(token, rol, this.username); //TODO: comprobar
          if (rol === roles.ADMINISTRADOR) {
            // Debugeo
            console.log("Administrador Iniciando sesion");
            this.$router.push("/admin");
          } else {
            this.$router.push("/");
          }
        })
        .catch((e) => {
          if (e.response.data.message === "Invalid credentials")
            this.res_error = true;
        });
    },
    checkCienciasEmail(v) {
      if (!v) {
        this.error_user = true;
        return false;
      }
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
            <div v-if="error_mesero">Un administrador ha de registrarte en el sistema.</div>
            <div v-else>Credenciales incorrectas</div>
          </div>
          <va-input
            v-model="username"
            label="Usuario"
            :rules="[
              (v) =>
                checkCienciasEmail(v) ||
                `El correo tiene que ser de la Facultad de Ciencias`,
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
          style="margin-top: 15px; margin-bottom: 15px"
          color="info"
          class="mr-4"
        >
          <router-link to="/user-signup">Crear cuenta</router-link>
        </va-button>
      </div>
    </div>
  </va-card>
</template>
