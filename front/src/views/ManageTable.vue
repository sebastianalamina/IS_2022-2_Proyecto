<script>
import {useAxios} from "../axios_common";
import {useRoute} from "vue-router";

export default {

	mounted() {

		// Cuando se redirige de /mesas.
		let idrest = useRoute().params.idrestaurante;
		if (idrest != null) {
			this.idRestaurante = idrest;
			this.buscarRestaurante();
		}

		// Cuando se redirige de /mesas.
		let idmesa = useRoute().params.idmesa;
		if (idmesa != null) {
			this.idMesa = idmesa;
			this.buscarMesa();
		}
	},

	data(){
		return{
			// Primeros ID's.
			idRestaurante: null,
			idMesa: null,

			// Booleanos de flujo.
			restQueried: false,
			tableQueried: false,

			// Contenedores.
			restaurantes: null,
			mesa: null,
			orden: null,
			selected: [],

			// Errores.
			errForm: null,
			errBotones: null,

			// Vistas de manipulación.
			// No supe hacerlo más limpio uwu
			mostrarBotones: true,
			mostrarAgregar: false,
			mostrarEliminar: false,
			mostrarCerrar : false,

			// Para agregar platillo.
			ordenParaAgregar: null,
			platilloParaAgregar: null,
			platillosDisponibles: [],

			// Para eliminar platillo.
			ordenParaEliminar: null,
			platilloParaEliminar: null,
			eliminarConfirmado: false,

			// Para cerrar orden.
			ordenPorCerrar: null,
			costoOrdenPorCerrar: null,

		}
	},

	methods:{

		async buscarRestauranteBoton(e) {

			// No recargar la página.
			e.preventDefault();

			// Redirección.
			this.buscarRestaurante();
		},

		async buscarRestaurante() {

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

			try {  // <- Issue #45 del repo.
			await axios
				.get('/restaurante')
				.then((res) => {

					let restaurante;
					for (restaurante in res.data) {
						if (res.data[restaurante].idrestaurante == parseInt(this.idRestaurante)) {
							return;
						}
					}
					this.errForm = "Restaurante no encontrado en la BD."

				}).catch((error) => {
					console.log(error)
					this.errForm = "Ocurrió un error:\n"+error.response.data;
				});
			} catch (e) {
				if (e.meta.cause === "Record to update not found.")
					return res.status(404).send({ error: "registro no encontrado" });
			}

			/*
			Si hubo errores, no continuamos.
			De lo contrario, ya se consultó el restaurante.
			*/
			if (this.errForm != null)
				return;
			this.restQueried = true;
		}, // <-- Fin de "buscarRestaurante".

		async buscarMesaBoton(e) {
			
			// No recargar la página.
			e.preventDefault();

			// Redirección.
			this.buscarMesa();
		}, // <- Fin de "buscarMesaBoton".

		async buscarMesa() {

			// Limpiamos.
			this.errForm = null;
			this.tableQueried = false;

			/*
			Indicar error si no se introdujo un ID.
			Y no continuar.
			*/
			if (this.idMesa == null) {
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
			try {  // <- Issue #45 del repo.
			await axios
				.get('/mesa', {
					params: {
						id_restaurante: this.idRestaurante,
					}
				}).then((res) => {

					let mesa;
					for (mesa in res.data) {
						if (res.data[mesa].idmesa == parseInt(this.idMesa)) {
							this.mesa = res.data[mesa];
							return;
						}
					}
					this.errForm = "Mesa no encontrada en la BD."

				}).catch((error) => {
					console.log(error)
				});
			} catch (e) {
				if (e.meta.cause === "Record to update not found.")
					return res.status(404).send({ error: "registro no encontrado" });
			}

			/*
			Si hubo errores, no continuamos.
			De lo contrario, ya se consultó el restaurante, por
			lo que indicamos y buscamos la orden correspondiente.
			*/
			if (this.errForm != null)
				return;

			this.tableQueried = true;
			this.buscarOrden();
		}, // <-- Fin de "buscarMesa".

		async buscarOrden() {

			// Consultamos con el Back.
			const axios = useAxios();
			try {  // <- Issue #45 del repo.
			await axios
				.get('/ordenes-mesa', {
					params: {
						idmesa: this.idMesa,
						idrestaurante: this.idRestaurante,
					},
				}).then((res) => {
					this.orden = res.data;
				}).catch((error) => {
					console.log(error);
				});
			} catch (e) {
				if (e.meta.cause === "Record to update not found.")
					return res.status(404).send({ error: "registro no encontrado" });
			}

			if (this.orden != null) {

				// Filtramos sólo las órdenes abiertas.
				this.orden = this.orden.filter(x => {
					return x.esCarrito;
				});
			}

		}, // <- Fin de "buscarOrden".

		async iniciarOrden(e) {
			
			// No recargar la página.
			e.preventDefault();

			// La creamos en el Back.
			const axios = useAxios();
			try {  // <- Issue #45 del repo.
			await axios
				.post('/ordenes-mesa', {
					idmesa: this.idMesa,
					idrestaurante: this.idRestaurante,
				}).then((res) => {
					this.orden = [res.data];
				}).catch((error) => {
					console.log(error);
				});
			} catch (e) {
				if (e.meta.cause === "Record to update not found.")
					return res.status(404).send({ error: "registro no encontrado" });
			}

		}, // <- Fin de "iniciarOrden".

		async cambiarOcupada(e) {
			
			// No recargar la página.
			e.preventDefault();

			// Cambiamos el estado en el Back.
			const axios = useAxios();
			try {  // <- Issue #45 del repo.
			await axios
				.post('/mesa', {
					idmesa: this.idMesa,
					ocupada: !this.mesa.ocupada,
				}).then((res) => {
					this.mesa = res.data;
				}).catch((error) => {
					console.log(error);
				});
			} catch (e) {
				if (e.meta.cause === "Record to update not found.")
					return res.status(404).send({ error: "registro no encontrado" });
			}

		}, // <-- Fin de "cambiarOcupada".

		async agregarPlatillo(e) {
			
			// No recargar la página.
			e.preventDefault();


			if (this.mostrarBotones) {
				// Cambiamos vistas.
				this.mostrarBotones = false;
				this.mostrarAgregar = true;

				// Buscamos los platillos disponibles en el restaurante.
				const axios = useAxios();
				try {  // <- Issue #45 del repo.
				await axios
					.get('/ordenes-mesa/platillos', {
						params: {
							idrestaurante: this.idRestaurante,
						},
					}).then((res) => {
						this.platillosDisponibles = res.data;
					}).catch((error) => {
						console.log(error);
					});
				} catch (e) {
					if (e.meta.cause === "Record to update not found.")
						return res.status(404).send({ error: "registro no encontrado" });
				}
			} else {
				// Agregamos el platillo a la orden dada.
				const axios = useAxios();
				try {  // <- Issue #45 del repo.
				await axios
					.post('/ordenes-mesa/agregar-platillo', {
						idplatillo: this.platilloParaAgregar,
						idorden: this.ordenParaAgregar,
					}).then((res) => {
						console.log("Agregando:", res.data);
					}).catch((error) => {
						console.log(error);
					});
				} catch (e) {
					if (e.meta.cause === "Record to update not found.")
						return res.status(404).send({ error: "registro no encontrado" });
				}
				// Actualizamos menús.
				this.buscarOrden();
				// Borramos valores.
				this.cancelar(e);
			}
		}, // <-- Fin de "agregarPlatillo".

		async eliminarSeleccion(e) {
			
			// No recargar la página.
			e.preventDefault();

			// Limpiando.
			this.errBotones = null;

			// Checamos que se haya seleccionado algo.
			if (this.selected == null || this.selected.length == 0) {
				this.errBotones = "Favor de escoger algún elemento de alguna orden.";
				return;
			}

			// Cambiamos vistas.
			this.mostrarBotones = false;
			this.mostrarEliminar = true;

			// Preguntamos por confirmación.
			if (!this.eliminarConfirmado) {
				this.eliminarConfirmado = true;
				return;
			}

			// Eliminamos cada elemento de la BD.
			let obj;
			for (obj in this.selected) {
				const axios = useAxios();
				try {  // <- Issue #45 del repo.
				await axios
					.post('/ordenes-mesa/eliminar-platillo', {
						idcontenidoorden: this.selected[obj].idcontenidoorden,
					}).then((res) => {
						console.log("Eliminando:", res.data);
					}).catch((error) => {
						console.log(error);
					});
				} catch (e) {
					if (e.meta.cause === "Record to update not found.")
						return res.status(404).send({ error: "registro no encontrado" });
				}
			}

			// Actualizamos menús.
			this.buscarOrden();
			// Borramos valores.
			this.cancelar(e);

		}, // <-- Fin de "eliminarSeleccion".

		async cerrarOrden(e) {
			
			// No recargar la página.
			e.preventDefault();

			// Cambiamos vistas.
			this.mostrarBotones = false;
			this.mostrarCerrar = true;

			/*
			No continuar si no se escogió orden a cerrar.
			*/
			if (this.ordenPorCerrar == null) {
				return;
			}

			console.log("uwu");

		}, // <-- Fin de "cerrarOrden".

		cancelar(e) {
			
			// No recargar la página.
			e.preventDefault();

			// Botones.
			this.mostrarBotones = true;

			// Agregar.
			this.mostrarAgregar = false;
			this.ordenParaAgregar = null;
			this.platilloParaAgregar = null;

			// Eliminar.
			this.mostrarEliminar = false;
			this.eliminarConfirmado = false;
			this.selected = [];

			// Cerrar orden.
			this.mostrarCerrar = false;
			this.ordenPorCerrar = null;
			this.costoOrdenPorCerrar = null;

		}, // <-- Fin de "cancelar".

	}, // <-- Fin de "methods".

} // <-- Fin de "export".

</script>

<template>

	<div v-if="!this.restQueried">
		<form @submit="buscarRestauranteBoton">
			<label>
				<h1>
					Introduce el ID del restaurante:
				</h1>
			</label>
			<input type="number" v-model="this.idRestaurante">
			<input type="submit" value="Buscar">
		</form>
	</div>

	<div v-else-if="!this.tableQueried">
		<form @submit="buscarMesaBoton">
			<label>
				<h1>
					Introduce el número de la mesa:
				</h1>
			</label>
			<input type="number" v-model="this.idMesa">
			<input type="submit" value="Buscar">
		</form>
	</div>

	<div v-else>
		<h1>
			Viendo la mesa #{{this.idMesa}} del restaurante #{{this.idRestaurante}}...
		</h1>

		<div v-if="this.orden == null || this.orden.length == 0">
			Aún no hay orden asociada a esta mesa. ¿Crear una?
			<form @submit="iniciarOrden">
				<input type="submit" value="Crear orden">
			</form>
		</div> <!--Fin del caso "no hay orden"-->

		<div v-else>
			<h6 v-if="this.orden.length > 1">¡Hay más de una orden abierta para esta mesa!</h6>
			¿La mesa está ocupada? {{this.mesa.ocupada}}
			<form class="mismalinea" @submit="cambiarOcupada">
				<input type="submit" value="Cambiar">
			</form>
			<br>
			Órdenes abiertas para esta mesa: {{this.orden.length}}
			<br><br>
			<div class="mismalinea" v-for="ord in orden">
				Orden #{{ord.idorden}}
				<br>
				Estado: {{ord.estado}}
				<br>
				Abierta (esCarrito): {{ord.esCarrito}}
				<br>
				Pagado: {{ord.pagado}}
				<br>
				Costo: {{ord.costo}}
				<br>
				<select v-model="this.selected" multiple>
					<option v-for="item in ord.contenido" v-bind:value="{idcontenidoorden: item.idcontenidoorden, costo: item.platillo.costo, nombre: item.platillo.nombre}">
						ID:{{item.idcontenidoorden}} {{item.platillo.nombre}} ${{item.platillo.costo}}
					</option>
				</select>
			</div>
			<br><br>
			Selección (debug): {{this.selected}}
			<br><br>

			<!-- Cuando no se ha presionado ninguno de los botones inferiores. -->
			<div v-if="this.mostrarBotones">
				<form class="mismalinea" @submit="agregarPlatillo">
					<input type="submit" value="Agregar platillo">
				</form>
				<form class="mismalinea" @submit="eliminarSeleccion">
					<input type="submit" value="Eliminar selección">
				</form>
				<form class="mismalinea" @submit="cerrarOrden">
					<input type="submit" value="Cerrar orden">
				</form>

				<div v-if="this.errBotones != null">
					{{this.errBotones}}
				</div>
			</div>

			<!-- Cuando se está agregando un platillo a alguna orden. -->
			<div v-if="this.mostrarAgregar">
				<form @submit="agregarPlatillo">
					Agregar a la orden:
					<select v-model="this.ordenParaAgregar">
						<option v-for="ord in this.orden" v-bind:value="ord.idorden">
							{{ord.idorden}}
						</option>
					</select>
					<br>
					Platillo a agregar:
					<select v-model="this.platilloParaAgregar">
						<option v-for="plat in this.platillosDisponibles" v-bind:value="plat.idplatillo">
							{{plat.nombre}}
						</option>
					</select>
					<br>
					<input type="submit" value="Agregar">
				</form>
				<form @submit="cancelar">
					<input type="submit" value="Cancelar">
				</form>
			</div>

			<!-- Cuando se está(n) eliminando platillo(s). -->
			<div v-if="this.mostrarEliminar">
				<br>
				¿Eliminar los siguientes elementos?
				<ul>
					<li v-for="elemento in this.selected">ID:{{elemento.idcontenidoorden}} {{elemento.nombre}} ${{elemento.costo}}</li>
				</ul>
				<br>
				<form @submit="eliminarSeleccion">
					<input type="submit" value="Confirmar">
				</form>
				<form @submit="cancelar">
					<input type="submit" value="Cancelar">
				</form>
			</div>

			<!-- Cuando se está(n) cerrando órden(es). -->
			<div v-if="this.mostrarCerrar">
				<form @submit="cerrarOrden">
					Orden a cerrar:
					<select v-model="this.ordenPorCerrar">
						<option v-for="ord in this.orden" v-bind:value="{idorden: ord.idorden, costo: ord.costo}">
							{{ord.idorden}}
						</option>
					</select>
					<br>
					Costo total:
					<span v-if="this.ordenPorCerrar != null">{{this.ordenPorCerrar.costo}}</span>
					<br>
					<input type="submit" value="Confirmar">
				</form>
				<form @submit="cancelar">
					<input type="submit" value="Cancelar">
				</form>
			</div>

		</div> <!--Fin del caso "sí hay orden"-->

	</div> <!--Fin del caso "consultados restaurante y mesa"-->

	<div v-if="this.errForm != null">
		<br>
		{{this.errForm}}
	</div>

</template>

<style>

.mismalinea {
	display: inline-block;
	margin-right: 20px;
}

</style>