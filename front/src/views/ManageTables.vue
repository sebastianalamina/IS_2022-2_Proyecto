<script>
import {useAxios} from "../axios_common";

export default {

	data() {
		return {
			idRestaurante: null,
			mesas: [],

			restQueried: false,
			errForm: null,
			errSelected: null,
			selected: [],
		}
	},

	methods: {

		async buscarRestaurante(e) {
			
			// No recargar la página.
			e.preventDefault();

			// Limpiamos.
			this.errForm = null;
			this.restQueried = false;

			/*
			Indicar error si no se introdujo un ID.
			Y no continuar.
			*/
			if (this.idRestaurante == null) {
				this.errForm = "Favor de introducir un ID.";
				return;
			}

			/*
			Checar permisos.
			*/
			// if () {
			// 	this.errForm = "No tienes permisos para hacer esta consulta."
			// 	return;
			// }

			// Consultamos con el Back.
			const axios = useAxios();
			await axios
				.get('restaurante/' + this.idRestaurante,
				// {
				// 	params: {
				// 		idrestaurante: this.idRestaurante,
				// 	}
				// }
				).then((res) => {

					if (res.data == null) {
						console.log(res)
						this.errForm = "Restaurante no encontrado."
					}

					// Si se consultan TODOS los restaurantes, en lugar de uno...
					// let restaurante;
					// for (restaurante in res.data) {
					// 	if (res.data[restaurante].idrestaurante == parseInt(this.idRestaurante)) {
					// 		return;
					// 	}
					// }
					// this.errForm = "Restaurante no encontrado en la BD."

				}).catch((error) => {
					console.log(error)
					this.errForm = "Ocurrió un error:\n"+error.response.data;
				});

			/*
			Si hubo errores, no continuamos.
			*/
			if (this.errForm != null)
				return;

			/*
			Si no hubo errores, ya se consultó el restaurante.
			Por lo que buscamos todas las mesas del mismo.
			*/
			await axios
				.get('/mesa', {
					params: {
						id_restaurante: this.idRestaurante,
					}
				}).then((res) => {
					this.mesas = res.data;
				}).catch((error) => {
					//console.log(error);
					this.errForm = "Ocurrió un error:\n"+error.response.data;
				});

			/*
			Si hubo errores, no continuamos.
			*/
			if (this.errForm != null)
				return;

			/*
			Si no hubo, ya se consultó el restaurante.
			*/
			this.restQueried = true;

		}, // <-- Fin de "buscarRestaurante".

		administrarMesa(e) {
			
			// No recargar la página.
			e.preventDefault();

			if (this.selected == null || this.selected.length == 0) {
				this.errSelected = "Favor de escoger una mesa.";
				return;
			}

			if (this.selected.length > 1) {
				this.errSelected = "Favor de escoger sólo una mesa";
				return;
			}

			// Redirección a la vista /mesa.
			let idMesa = this.selected[0].idmesa
			this.$router.push({
				name: "administrar mesa",
				params: {
					idrestaurante: this.idRestaurante,
					idmesa: idMesa,
				}
			});

		} // <- Fin de "administrarMesa".

	}, // <- Fin de "methods".

} // <- Fin de "export".

</script>

<template>

	<div v-if="!this.restQueried">
		<form @submit="buscarRestaurante">
			<label>
				<h1>
					Introduce el ID del restaurante:
				</h1>
			</label>
			<input type="number" v-model="this.idRestaurante">
			<input type="submit" value="Buscar">
		</form>
		<div v-if="this.errForm != null">
			{{this.errForm}}
		</div>
	</div>

	<div v-else>
		<h1>
			Viendo las mesas del restaurante #{{this.idRestaurante}}...
		</h1>

		<br>

		<div v-if="this.errSelected != null">
			{{this.errSelected}}
		</div>
		<select v-if="this.mesas.length > 0" v-model="this.selected" multiple>
			<option
			  v-for="mesa in mesas" v-bind:value="{idmesa: mesa.idmesa}" :class="[mesa.ocupada ? 'rojo' : 'verde']">
				Mesa #{{mesa.idmesa}}. ¿Ocupada? {{mesa.ocupada}}
			</option>
		</select>

		<br><br>

		<form @submit="administrarMesa">
			<input type="submit" value="Administrar mesa">
		</form>
	</div>

</template>

<style>

.verde {
  background-color: #53b853;
}

.rojo {
  background-color: #b85353;
}

</style>