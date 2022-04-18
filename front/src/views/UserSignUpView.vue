<script>

// Longitud del nombre de usuario.
const MIN_ID_CLIENTE_LENGTH = 6
const MAX_ID_CLIENTE_LENGTH = 15

export default {
  data(){
    return{
      errors:[], // Arreglo de posibles errores del form.
      idCliente:null,
      idClienteError:null,
      nombre:null,
      nombreError:null,
      aPaterno:null,
      aPaternoError:null,
      aMaterno:null,
      aMaternoError:null,
      correo:null,
      correoError:null,
      password0:null,
      password0Error:null,
      password1:null,
      password1Error:null,
      estado:null,
      estadoError:null,
      calle:null,
      calleError:null,
      numero:null,
      numeroError:null,
      cp:null,
      cpError:null,
      municipio:null,
      municipioError:null,
    }
  },
  methods:{
    checkForm:function(e) {

      // Chequeo del nombre de usuario (el ID del cliente).
      this.idClienteError = ""
      if (!this.idCliente)
        this.idClienteError = "Campo requerido."
      else if (this.idCliente.length < MIN_ID_CLIENTE_LENGTH || this.idCliente.length > MAX_ID_CLIENTE_LENGTH)
        this.idClienteError = `El nombre de usuario debe tener entre ${MIN_ID_CLIENTE_LENGTH} y ${MAX_ID_CLIENTE_LENGTH} caracteres.`

      // Chequeo del nombre del usuario.
      this.nombreError = ""
      if (!this.nombre)
        this.nombreError = "Campo requerido."

      // Chequeo del correo electrónico.
      this.correoError = ""
      if (!this.correo)
        this.correoError = "Campo requerido."

      // Chequeo de la contraseña.
      this.password0Error = ""
      this.password1Error = ""
      if (!this.password0)
        this.password0Error = "Campo requerido."
      if (!this.password1)
        this.password1Error = "Campo requerido."
      else if (this.password0 != this.password1)
        this.password1Error = "Las contraseñas no coinciden."

      // TODO / TO-DO / TO DO
      // El resto se determinará cuando la Base de Datos esté más actualizada.

      // ?
      e.preventDefault();
    },
  }
}

</script>

<template>

  <div class="mitad izquierda">
    <form id="signup-box" @submit="checkForm"> <!-- action="/something" method="post"> -->

      <section>
        <label class="form-label">* Usuario</label>
        <p class="error" v-if="idClienteError">{{idClienteError}}</p>
        <input type="text" class="form-control" v-model="idCliente">
      </section>

      <section>
        <label class="form-label">* Nombre</label>
        <p class="error" v-if="nombreError">{{nombreError}}</p>
        <input type="text" class="form-control" v-model="nombre">
      </section>

      <section>
        <label class="form-label">Apellido Paterno</label>
        <p class="error" v-if="aPaternoError">{{aPaternoError}}</p>
        <input type="text" class="form-control" v-model="aPaterno">
      </section>

      <section>
        <label class="form-label">Apellido Materno</label>
        <p class="error" v-if="aMaternoError">{{aMaternoError}}</p>
        <input type="text" class="form-control" v-model="aMaterno">
      </section>

      <section>
        <label class="form-label">* Correo electrónico</label>
        <p class="error" v-if="correoError">{{correoError}}</p>
        <input type="text" class="form-control" v-model="correo">
      </section>

      <section>
        <label class="form-label">* Contraseña</label>
        <p class="error" v-if="password0Error">{{password0Error}}</p>
        <input type="password" class="form-control" v-model="password0">
      </section>

      <section>
        <label class="form-label">* Confirmar constraseña</label>
        <p class="error" v-if="password1Error">{{password1Error}}</p>
        <input type="password" class="form-control" v-model="password1">
      </section>

      <section>
        <label class="form-label">Estado</label>
        <p class="error" v-if="estadoError">{{estadoError}}</p>
        <input type="text" class="form-control" v-model="estado">
      </section>

      <section>
        <label class="form-label">Calle</label>
        <p class="error" v-if="calleError">{{calleError}}</p>
        <input type="text" class="form-control" v-model="calle">
      </section>

      <section>
        <label class="form-label">Número (creo que de calle)</label>
        <p class="error" v-if="numeroError">{{numeroError}}</p>
        <input type="text" class="form-control" v-model="numero">
      </section>

      <section>
        <label class="form-label">Código postal</label>
        <p class="error" v-if="cpError">{{cpError}}</p>
        <input type="text" class="form-control" v-model="cp">
      </section>

      <section>
        <label class="form-label">Municipio</label>
        <p class="error" v-if="municipioError">{{municipioError}}</p>
        <input type="text" class="form-control" v-model="municipio">
      </section>
      
      <input class="btn btn-secondary" type="submit" value="Registrarse">

    </form>
  </div>

  <div class="mitad derecha">
    <section>
      <h1>Producto</h1>
      <p>¡Ahora puedes pedir mesa antes de llegar al restaurante!</p>
    </section>
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
