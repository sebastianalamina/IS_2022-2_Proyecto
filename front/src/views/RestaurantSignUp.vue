<script>

import { useAxios } from '../axios_common'
import { useStore as useAdminStore } from '../stores/admin'

export default { 
    data() {
        return {
            nombre : null,
            nombreError : null,
            estado : null,
            estadoError : null,
            calle : null,
            calleError : null,
            numero : null,
            numeroError : null,
            cp : null,
            cpError : null,
            municipio : null,
            municipioError : null, 
            resultado: null,
            resultadoError: null,
        };
    },
    methods: {
        checkForm: function (e) {
            // Checamos el nombre del restaurante 
            this.nombreError = null;
            if(!this.nombre)
              this.nombreError = "Nombre requerido.";
            //Checamos el estado
            this.estadoError = null;
            if(!this.estado)
              this.estadoError = "Estado requerido.";
            // Checamos la calle.
            this.calleError =null;
            if(!this.calle)
              this.calleError = "Calle requerida";
            // Checamos el numero
            this.numeroError =null;
            if(!this.numero)
              this.numeroError = "Numero requerido";
            // Checamos el cp
            this.cpError =null;
            if(!this.cp)
              this.cpError = "codigo postal requerido";
            // Checamos el municipio 
            this.municipioError =null;
            if(!this.municipio)
              this.municipioError = "Calle requerida"; 
            return !this.nombreError && !this.calleError && !this.estadoError && !this.numeroError && !this.municipioError && !this.cpError;
        },
        register: function (e) {
            // Evita que se recargue la página.
            e.preventDefault();
            //const authStore = useAuthStore();
            const adminStore = useAdminStore();
            const axios = useAxios();
            if (!this.checkForm())
                return;
            this.resultado = null;
            this.resultadoError = null;
            console.log(JSON.stringify({
                nombre : this.nombre,
                estado : this.estado,
                calle : this.calle,
                numero : this.numero,
                municipio : this.municipio,
                cp : this.cp,
            }))
            axios.post("/restaurante", {
                nombre : this.nombre,
                estado : this.estado,
                calle : this.calle,
                numero : this.numero,
                municipio : this.municipio,
                cp : this.cp,
            }).then((res) => {

                if (res.status == 200) {
                    this.resultado = "Restaurante creado con éxito.";
                    //this.$router.push("/login");
                    console.log("estos son los datos : ", JSON.stringify(res.data));
                    adminStore.setRestaurante({ 
                        nombre : this.nombre,
                        estado : this.estado,
                        calle : this.calle,
                        numero : this.numero,
                        municipio : this.municipio,
                        cp : this.cp,
                        idrestaurante : res.data.idrestaurante
                    });
                    this.$router.push("/admin");
                }
            })
                .catch((error) => {
                console.log(error);
                this.resultadoError = error.response.data.error;
            });
        },
    },
}

</script>

<template>


<div>
  <h1> Registro de restaurante. </h1>
<form id="signup-box" @submit="register"> <!-- action="/something" method="post"> -->

      <section>
        <label class="form-label">* Nombre de restaurante</label>
        <p class="error" v-if="nombreError">{{nombreError}}</p>
        <input type="text" class="form-control" v-model="nombre">
      </section>

      <section>
        <label class="form-label">* Estado</label>
        <p class="error" v-if="estadoError">{{estadoError}}</p>
        <input type="text" class="form-control" v-model="estado">
      </section>

      <section>
        <label class="form-label">* Calle</label>
        <p class="error" v-if="calleError">{{calleError}}</p>
        <input type="text" class="form-control" v-model="calle">
      </section>

      <section>
        <label class="form-label">* Numero</label>
        <p class="error" v-if="numeroError">{{numeroError}}</p>
        <input type="text" class="form-control" v-model="numero">
      </section>

      <section>
        <label class="form-label">* Codigo postal</label>
        <p class="error" v-if="cpError">{{cpError}}</p>
        <input type="text" class="form-control" v-model="cp">
      </section>

      <section>
        <label class="form-label">* Municipio</label>
        <p class="error" v-if="municipioError">{{municipioError}}</p>
        <input type="text" class="form-control" v-model="municipio">
      </section>

      

      <p class="resultado" v-if="resultado">{{resultado}}</p>
      <p class="error" v-if="resultadoError">{{resultadoError}}</p>

      <input class="btn btn-secondary" type="submit" value="Registrar restaurante">

    </form>

</div>
</template>
<style>

#signup-box {
  margin: auto;
  padding-top: 10%;
  width: 35%;
}

section {
  padding-bottom: 25px;
}

p.error {
  color: red;
  font-size: 12px;
}

p.resultado {
  color:  green;
  font-size: 12px;
}

.mitad {
  height: 100%;
  width: 50%;
  position: fixed;
  z-index: 1;
  top: 0;
  overflow-x: hidden;
  padding-top: 20px;
}

/* Mitad izquierda. */
.izquierda {
  left: 0;
}

/* Mitad derecha. */
.derecha {
  padding-top: 10%;
  right: 0;
}

</style>
