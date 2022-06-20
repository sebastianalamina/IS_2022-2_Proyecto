import { defineStore } from "pinia";
import {
  INVITADO,
  CLIENTE,
  MESERO,
  COCINERO,
  ADMINISTRADOR,
  REPARTIDOR,
} from "../constants/roles";

// useStore could be anything like useUser, useCart
// the first argument is a unique id of the store across your application
export const useStore = defineStore("auth", {
  state: () => ({
    token: null,
    rol: null,
    email: null,
  }),
  getters: {
    isLogged: (state) => !!state.token,
    hasPermisionsOf: (state) => (rol) => {
      switch (rol) {
        case INVITADO:
          return true;
        case CLIENTE:
          return state.rol === CLIENTE;
        case MESERO:
          return MESERO === state.rol;
        case COCINERO:
          return [MESERO, ADMINISTRADOR].includes(state.rol);
        case ADMINISTRADOR:
          return state.rol === ADMINISTRADOR;
        case REPARTIDOR:
          return state.rol === REPARTIDOR;
      }
    },
  },
  actions: {
    login(token, rol, email) {
      this.token = token;
      this.rol = rol;
      this.email = email;
    },
    logout() {
      this.token = null;
      this.rol = null;
    },
  },
  persist: true,
});
