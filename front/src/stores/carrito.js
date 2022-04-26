import { defineStore } from "pinia";

function createplatillo(platillo, cantidad) {
  return {
    ...platillo,
    cantidad,
  };
}

// useStore could be anything like useUser, useCart
// the first argument is a unique id of the store across your application
export const useCarrito = defineStore("carrito", {
  state: () => ({
    platillos: {},
  }),
  // getters: {
  //   isLogged: (state) => state.token != null,
  // },
  actions: {
    // Acción para aumentar en uno el platillo
    increase(platillo) {
      if (!"id" in platillo) throw new Error("platillo debe tener id");
      if (platillo.id in this.platillos)
        this.platillos[platillo.id] = createplatillo(
          platillo,
          this.platillos[platillo.id].cantidad + 1
        );
      else this.platillos[platillo.id] = createplatillo(platillo, 0);
    },
    set(platillo, cantidad) {
      this.platillos[platillo.id] = createplatillo(platillo, cantidad);
    },
    decrease(platillo) {
      if (platillo.id in this.platillos)
        this.platillos[platillo.id] = createplatillo(
          platillo,
          this.platillos[platillo.id].cantidad - 1
        );
      if (this.platillos[platillo.id].cantidad <= 0)
        delete this.platillos[platillo.id];
    },
    remove(platillo) {
      delete this.platillos[platillo.id];
    },
  },
});
