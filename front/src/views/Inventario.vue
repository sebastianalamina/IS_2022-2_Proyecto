<script>
import ModalInventario from '../components/ModalInvetario.vue'
import axios from 'axios'
import {useAxios} from '../axios_common'


// TODO Hacer que el modal inventario sea una modal component de a deveras xd

export default {
    components:{ 
        ModalInventario
    },
    data(){
        return{
            isModalVisible: false, 
            id_restaurante : this.$route.params.id,
            nombre_restaurante : 0,
            productos : [],
        }
    },
    methods: {
        showModal: function(){
            console.log('modal')
            this.isModalVisible = true
            console.log(this.isModalVisible)
        },
        closeModal: function(){
            this.isModalVisible = false;
        },
        agregarProducto: function(producto){
            console.log('agregando producto')
            console.log(producto)
            this.productos.push(producto)
        },
        eliminarProducto: function(producto){
            console.log('eliminando producto')
            console.log(producto)
            this.productos.splice(this.productos.indexOf(producto), 1)
        },
        actualizarProducto: function(producto){
            console.log('actualizando producto')
            console.log(producto)
            this.productos.splice(this.productos.indexOf(producto), 1, producto)
        }, 
    }, 
    mounted() {
        useAxios.get({
            params:{
                id_restaurante: this.$route.params.id
            }
        }).then(res=>{
            console.log('request valida')
            this.productos = res.data
        }).catch(err=>{
            console.log(err)
        });
    }
}
</script>

<template>
<div>
    <h1>Inventario del restaurante: {{id_restaurante}}</h1>
    <div class="center">
        <ul>
            <li v-for="producto in productos " v-bind:key="producto.idinventario" >
                <h3>{{producto.nombre}}</h3> 
                <p>Cantidad actual: {{producto.cantidad}}</p>
            </li>
        </ul>

    </div>
    <button @click="showModal"> Agregar productos</button>

<ModalInventario :idRestaurante="String(id_restaurante)" :items_array="productos" v-show="isModalVisible" @close="closeModal" />
</div>


</template>