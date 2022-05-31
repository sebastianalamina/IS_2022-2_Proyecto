import { defineStore } from "pinia";

export const useStore = defineStore("admin",{
    state:()=>({
        idRestaurante : null,
        nombreRestaurante : null,
    }),
    getters:{

    },
    actions:{
        setRestaurante(restaurante){
            this.idRestaurante = restaurante.idrestaurante;
            this.nombreRestaurante = restaurante.nombre;
        }
    },
    persist : true,
});