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
  getters: {
    platillosArray: (state) =>
      Object.values(state.platillos).filter((x) => !!x),
    totalPagar : (state) =>
      Object.values(state.platillos).filter((x) => !!x).map((x)=> x.costo * x.cantidad).reduce((a,b)=> a+b, 0), 
    cantidadPlatillos : (state)=>
      Object.values(state.platillos).filter((x) => !!x).length
  },
  actions: {
    // Acción para aumentar en uno el platillo
    increase(platillo) {
      console.log("este es el id del platillo xd` ",platillo.idplatillo);
      if (!"idplatillo" in platillo)
        throw new Error("platillo debe tener idplatillo");
      if (platillo.idplatillo in this.platillos){
        console.log(this.platillos[platillo.idplatillo]);
          this.platillos[platillo.idplatillo] = createplatillo(
          platillo,
          this.platillos[platillo.idplatillo].cantidad + 1
        );
      }
      else this.platillos[platillo.idplatillo] = createplatillo(platillo, 1);
    },
    set(platillo, cantidad) {
      this.platillos[platillo.idplatillo] = createplatillo(platillo, cantidad);
    },
    decrease(platillo) {
      if (platillo.idplatillo in this.platillos)
        this.platillos[platillo.idplatillo] = createplatillo(
          platillo,
          this.platillos[platillo.idplatillo].cantidad - 1
        );
      if (this.platillos[platillo.idplatillo].cantidad <= 0)
        delete this.platillos[platillo.idplatillo];
    },
    remove(platillo) {
      delete this.platillos[platillo.idplatillo];
    },
    clean() {
      this.platillos = [];
    },
  },
  persist: true,
});
