<script>

import { useStore as useAdminStore } from '../stores/admin';
import NavBar from '../components/NavBar.vue';
import { useAxios } from '../axios_common';

export default {
    data() {
        return {
            nombreRestaurante: null,
            idRestaurante: null,
            totalMeseros: null,
            totalPlatillos : null,
            direccionRestaurante : null,
        };
    },
    mounted() {
        const adminStore = useAdminStore();
        this.idRestaurante = adminStore.idRestaurante;
        this.nombreRestaurante = adminStore.nombreRestaurante;
        if(this.idRestaurante){
          console.log("vista logeada")
          this.getSummary();
        }
        console.log("vista NO logeada");
    },
    methods:{
        getSummary(){
            const instance = useAxios();
            const ruta = "admin/restaurante";
            instance.get(ruta)
            .then((res)=>{
                console.log("listo");
                console.log(JSON.stringify(res.data));
                this.totalMeseros = res.data._count.mesero;
                this.totalPlatillos = res.data.menu[0]._count.platillo;
                this.direccionRestaurante = res.data.calle + res.data.numero + "," + res.data.municipio
            })
            .catch((err)=>{
                console.log("error");
                console.log(err);
            });
        }
    }
}
</script>

<template>



<div
class="col"
v-if="idRestaurante"
>
  <h1 > Ventana de administrador de restaurante</h1> 
    <div class="row">
    <div class="flex md6 lg4">
      <va-card>
        <va-card-title>Datos del restaurante</va-card-title>
        <va-card-content>
            Nombre del restaurante {{nombreRestaurante}}.
            <br>
            Direccion del restaurante {{direccionRestaurante}}.
        </va-card-content>
      </va-card>
    </div>
    </div>

<div class="row">
    <div class="flex md6 lg4">
      <va-card>
        <va-card-title>Empleados del restaurante</va-card-title>
        <va-card-content>
            Usted tiene un total de {{totalMeseros}} empleados.
            <br>
            <va-button
            @click="this.$router.push({path : '/view-employees' })" 
            >
            Ver lista de empleados 
            </va-button>
        </va-card-content>
      </va-card>
    </div>
</div>

<div class="row">
    <div class="flex md6 lg4">
      <va-card>
        <va-card-title>Productos del restaurante del restaurante</va-card-title>
        <va-card-content>
            Usted tiene un total de productos {{totalPlatillos}}.
            <br>
            <va-button
            @click="this.$router.push({path : '/menu/' + idRestaurante})" 
            >
            Ver menu
            </va-button>
        </va-card-content>
      </va-card>
    </div>
</div>

</div>
<div
v-if="!idRestaurante"
>
Usted no ha agregado un restaurnate 
<va-button
@click="this.$router.push({path : '/restaurant-signup' })"
>
  Crear restaurante
</va-button>
</div>
</template>




<style lang="css" scoped>

</style>