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
  }),
  getters: {
    isLogged: (state) => !!state.token,
    hasPermisionsOf: (state) => (rol) => {
      switch (rol) {
        case INVITADO:
          return true;
        case CLIENTE:
          return [
            CLIENTE,
            MESERO,
            COCINERO,
            ADMINISTRADOR,
            REPARTIDOR,
          ].includes(state.rol);
        case MESERO:
          return [MESERO, COCINERO, ADMINISTRADOR].includes(state.rol);
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
    login(token, rol) {
      this.token = token;
      this.rol = rol;
    },
    logout() {
      this.token = null;
      this.rol = null;
    },
  },
  persist: true,
});
