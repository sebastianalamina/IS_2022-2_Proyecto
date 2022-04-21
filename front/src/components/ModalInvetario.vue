<script>
import axios from 'axios';

export default{
   name: 'ModalInventario' ,
   data(){
     return{
      item_name : null,
      item_quant : null,
      array : this.items_array
     } 
   },
   methods:{
      close(){
         this.$emit('close')
      },
      agregarElemento: function(){
         console.log('Agregando elemento al inventario');
         // Envia con axios una post request al backend para agregar el nuevo 
         console.log(String(this.idRestaurante))
         axios.post('http://localhost:3001/inventario/',{
            id_restaurante : String(this.idRestaurante),
            nombre :   this.item_name,
            cantidad : Number(this.item_quant),
         })
         .then((res)=>{
            // Checks if the value was updated
            const repeated = this.items_array.findIndex(item=>item.idinventario === 20);
            if (repeated >= 0 ) {
               // If it was updated overwrites the previous value
               console.log('se actualizo un valor')
               this.items_array[repeated].cantidad = Number(this.item_quant) 
            } else {
               // If it was a new item it pushes it to the arrya
               console.log(' nuevo elemento creado')
               this.items_array.push(res.data);
            }
            console.log('Se agrego de forma apropiada ')
            console.log(JSON.stringify(this.items_array))

         },(error)=>{
            console.log(error)
         });
      }, 
   },
   props:{
      items_array: Array,
      idRestaurante: String
   }, 
}

</script>

<template>
   <div >
      <form @submit.prevent="agregarElemento">
  <div class="form-group">
    <label for="formGroupExampleInput">Nombre del producto a agregar</label>
    <input type="text" v-model="item_name" class="form-control" id="formGroupExampleInput" placeholder="Manzanas Gala">
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">Cantidad del producto</label>
    <input v-model="item_quant" type="text" class="form-control" id="formGroupExampleInput2" placeholder="10">
  </div>
  <button type="submit" class="btn btn-primary"> Agregar elemento </button>
</form  >
    <button v-on:click="close"> cerrar</button>
   </div> 
</template>