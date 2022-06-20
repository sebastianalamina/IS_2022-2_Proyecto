<script>
import { useAxios } from "../axios_common";
import { useStore as useAuthStore } from "../stores/auth";
import roles from "../constants/roles";

export default {
  mounted() {
    const auth = useAuthStore();
    if (auth.hasPermisionsOf(roles.MESERO)) {
      // Buscamos el ID del restaurante.
      const axios = useAxios();

      try {
        // <- Issue #45 del repo.
        axios
          .get("/mesero/get-restaurante", {
            params: {
              email: auth.email,
            },
          })
          .then((res) => {
            if (res.data) {
              this.idRestaurante = res.data;
              this.buscarRestaurante();
            }
          })
          .catch((e) => {
            // console.log(e);
          });
      } catch (e) {
        // console.log(e);
      }
    } else {
      this.errForm = "ERROR: Debes estar loggeado con una cuenta de mesero.";
    }
  },

  data() {
    return {
      idRestaurante: null,
      mesas: [],

      restQueried: false,
      errForm: null,
      errSelected: null,
      selected: [],
    };
  },

  methods: {
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
      try {
        // <- Issue #45 del repo.
        await axios
          .get(
            "restaurante/" + this.idRestaurante
            // {
            // 	params: {
            // 		idrestaurante: this.idRestaurante,
            // 	}
            // }
          )
          .then((res) => {
            if (res.data == null) {
              console.log(res);
              this.errForm = "Restaurante no encontrado.";
            }

            // Si se consultan TODOS los restaurantes, en lugar de uno...
            // let restaurante;
            // for (restaurante in res.data) {
            // 	if (res.data[restaurante].idrestaurante == parseInt(this.idRestaurante)) {
            // 		return;
            // 	}
            // }
            // this.errForm = "Restaurante no encontrado en la BD."
          })
          .catch((error) => {
            console.log(error);
            this.errForm = "Ocurrió un error:\n" + error.response.data;
          });
      } catch (e) {
        if (e.meta.cause === "Record to update not found.")
          return res.status(404).send({ error: "registro no encontrado" });
      }

      /*
			Si hubo errores, no continuamos.
			*/
      if (this.errForm != null) return;

      /*
			Si no hubo errores, ya se consultó el restaurante.
			Por lo que buscamos todas las mesas del mismo.
			*/
      try {
        // <- Issue #45 del repo.
        await axios
          .get("/mesa", {
            params: {
              id_restaurante: this.idRestaurante,
            },
          })
          .then((res) => {
            this.mesas = res.data;
          })
          .catch((error) => {
            //console.log(error);
            this.errForm = "Ocurrió un error:\n" + error.response.data;
          });
      } catch (e) {
        if (e.meta.cause === "Record to update not found.")
          return res.status(404).send({ error: "registro no encontrado" });
      }

      /*
			Si hubo errores, no continuamos.
			*/
      if (this.errForm != null) return;

      /*
			Si no hubo, ya se consultó el restaurante.
			*/
      this.restQueried = true;
    }, // <-- Fin de "buscarRestaurante".

    administrarMesa(idMesa) {
      this.$router.push({
        name: "administrar mesa",
        params: {
          idrestaurante: this.idRestaurante,
          idmesa: idMesa,
        },
      });
    }, // <- Fin de "administrarMesa".

    async agregarMesa(e) {
      // No recargar la página.
      e.preventDefault();

      // Agregamos la mesa al restaurante.
      const axios = useAxios();
      try {
        // <- Issue #45 del repo.
        await axios
          .post("/ordenes-mesa/agregar-mesa", {
            idrestaurante: this.idRestaurante,
          })
          .then((res) => {
            console.log("Agregando:", res.data);
          })
          .catch((error) => {
            console.log(error);
          });
      } catch (e) {
        return res.status(404).send({ error: e });
      }

      // Recargamos la lista de mesas.
      this.buscarRestaurante();
    }, // <- Fin de "agregarMesa".
    test(e) {
      console.log(e);
    },
  }, // <- Fin de "methods".
}; // <- Fin de "export".
</script>

<template>
  <div v-if="!this.restQueried">
    <form @submit="buscarRestauranteBoton">
      <label>
        <h1>Introduce el ID del restaurante:</h1>
      </label>
      <input type="number" v-model="this.idRestaurante" />
      <va-button type="submit" value="Buscar">Buscar</va-button>
    </form>
    <div v-if="this.errForm != null">
      {{ this.errForm }}
    </div>
  </div>

  <div v-else>
    <h1>Viendo las mesas del restaurante #{{ this.idRestaurante }}...</h1>

    <br />

    <div v-if="this.errSelected != null">
      {{ this.errSelected }}
    </div>
    <div class="va-table-responsive">
      <table class="va-table va-table--clickable">
        <thead>
          <tr>
            <th>Mesa</th>
            <th>Estado</th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="mesa in mesas"
            :key="mesa.idmesa"
            @click="() => administrarMesa(mesa.idmesa)"
          >
            <td>{{ mesa.idmesa }}</td>
            <td>
              <va-badge v-if="!mesa.ocupada" text="libre" color="success" />
              <va-badge v-else text="ocupada" color="danger" />
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <br /><br />

    <br />
    <form @submit="agregarMesa">
      <va-button type="submit" value="Añadir nueva mesa"
        >Añadir nueva mesa</va-button
      >
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
