<script>

import { useStore as useAdminStore } from '../stores/admin';
import NavBar from '../components/NavBar.vue';
import { useAxios } from '../axios_common';

/**
 * TODO
 * * Checar que el usuario tenga los privilegios apropiados
 * * Checar que el usuario si tenga un restaurnate 
 * * en caso de que si lo tenga hacemos que se cargue el dashboard de administrador
 * 
 */

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
        this.getSummary();
    },
    methods:{
        getSummary(){
            const instance = useAxios();
            const admin = useAdminStore();
            const ruta = "admin/restaurante";
            instance.get(ruta)
            .then((res)=>{
                console.log("listo");
                console.log(JSON.stringify(res.data));
                console.log("Seteando los valores de la store");
                admin.idRestaurante = res.data.idrestaurante;
                this.idRestaurante = res.data.idrestaurante
                this.nombreRestaurante = res.data.nombre;
                console.log("valores de la store ",admin.idRestaurante  )
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
Usted no ha agregado un restaurante 
<va-button
@click="this.$router.push({path : '/restaurant-signup' })"
>
  Crear restaurante
</va-button>
</div>
</template>




<style lang="css" scoped>

</style>