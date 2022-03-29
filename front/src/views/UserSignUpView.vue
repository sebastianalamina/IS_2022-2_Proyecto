<script>

export default {
  data(){
    return{
    }
  },
  methods:{
  }
}

</script>

<template>

  <div class="mitad izquierda">
    <form id="signup-box" @submit="checkForm"> <!-- action="/something" method="post"> -->

      <section>
        <label class="form-label">Email</label>
        <input type="text" class="form-control" v-model="email">
        <p class="error" v-if="false">En caso de error</p>
      </section>

      <section>
        <label class="form-label">Nombre</label>
        <input type="text" class="form-control" v-model="name">
        <p class="error" v-if="false">En caso de error</p>
      </section>

      <section>
        <label class="form-label">Apellido Paterno</label>
        <input type="text" class="form-control" v-model="father_surname">
        <p class="error" v-if="false">En caso de error</p>
      </section>

      <section>
        <label class="form-label">Apellido Materno</label>
        <input type="text" class="form-control" v-model="mother_surname">
        <p class="error" v-if="false">En caso de error</p>
      </section>

      <section>
        <label class="form-label">Contraseña</label>
        <input type="password" class="form-control" v-model="password0">
        <p class="error" v-if="false">En caso de error</p>
      </section>

      <section>
        <label class="form-label">Confirmar constraseña</label>
        <input type="password" class="form-control" v-model="password1">
        <p class="error" v-if="false">En caso de error</p>
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
@import "@/assets/base.css";

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
