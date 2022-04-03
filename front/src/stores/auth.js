import { defineStore } from "pinia";

// useStore could be anything like useUser, useCart
// the first argument is a unique id of the store across your application
export const useStore = defineStore("auth", {
  state: () => ({
    token: null,
  }),
  getters: {
    isLogged: (state) => state.token != null,
  },
  actions: {
    login(token) {
      this.token = token;
    },
    logout() {
      this.token = false;
    },
  },
});
