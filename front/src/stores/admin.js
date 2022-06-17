import { defineStore } from "pinia";

export const useStore = defineStore("admin",{
    state:()=>({
        idRestaurante : null,
    }),
    getters:{
        isAdminOf:(state)=>(idRestaurante)=>(state.idRestaurante == idRestaurante),
    },
    actions:{
        setRestaurante(restaurante){
            this.idRestaurante = restaurante.idrestaurante;
        },
        reset(){
            this.idRestaurante = null;
        }
    },
    persist : true
});