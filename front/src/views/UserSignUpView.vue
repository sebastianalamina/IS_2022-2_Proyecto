<script>

export default {
  data(){
    return{
      errors:[], // Arreglo de posibles errores del form.
      correo:null,
      correoError:null,
      password0:null,
      password0Error:null,
      password1:null,
      password1Error:null,
      rol:null,
      rolError:null,
    }
  },
  methods:{
    checkForm:function(e) {

      // Chequeo del correo electrónico.
      this.correoError = null
      if (!this.correo)
        this.correoError = "Campo requerido."

      // Chequeo de la contraseña.
      this.password0Error = null
      this.password1Error = null
      if (!this.password0)
        this.password0Error = "Campo requerido."
      if (!this.password1)
        this.password1Error = "Campo requerido."
      else if (this.password0 != this.password1)
        this.password1Error = "Las contraseñas no coinciden."

      // Chequeo del rol.
      this.rolError = null
      if (!this.rol)
        this.rolError = "Campo requerido."

      // Evita que se recargue la página.
      e.preventDefault();
    },
  }
}

</script>

<template>

  <div class="mitad izquierda">
    <form id="signup-box" @submit="checkForm"> <!-- action="/something" method="post"> -->

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
        <label class="form-label">* Rol</label>
        <p class="error" v-if="rolError">{{rolError}}</p>
        <select class="form-control" v-model="rol">
          <option>Administrador</option>
          <option>Cliente</option>
          <option>Cocinero</option>
          <option>Mesero</option>
          <option>Repartidor</option>
        </select>
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
