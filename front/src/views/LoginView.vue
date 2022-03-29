<script>

// La longitud mínima que debe
// cumplir cada nombre de usuario.
const MIN_USERNAME_LENGTH = 5

export default {
  data(){
    return{
      errors:[], // Arreglo de posibles errores del form.
      username:null, // Nombre de usuario del form.
      password:null // Contraseña del form.
    }
  },
  methods:{
    checkForm:function(e) {

      // Arreglo con los posibles
      // errores del form.
      this.errors = [];
      
      // Si no se introdujo nombre de usuario, se agrega
      // un error. De lo contrario, se comprueba que este
      // usuario sea válido.
      if (!this.username) {
        this.errors.push("Es necesario proveer un usuario.");
      } else
        this.validUsername();

      // Si no se introdujo una contraseña, se agrega un error.
      if (!this.password)
        this.errors.push("Es necesario proveer una contraseña.");

      // Si no hay errores, el form fue llenado correctamente.
      if(!this.errors.length)
        return true;

      // ?
      e.preventDefault();
    },
    validUsername:function() {
      // Si el usuario no cumple la longitud mínima, se agrega un error.
      if (this.username.length < MIN_USERNAME_LENGTH)
        this.errors.push("El usuario debe tener longitud al menos "+MIN_USERNAME_LENGTH+".");
    }
  }
}

</script>

<template>

  <form id="login-box" @submit="checkForm"> <!-- action="/something" method="post"> -->

    <section id="user-zone">
      <label class="form-label">Usuario</label>
      <input type="text" class="form-control" v-model="username">
    </section>

    <section id="pass-zone">
      <label class="form-label">Contraseña</label>
      <input type="password" class="form-control" v-model="password">
    </section>

    <p id="errors-zone" v-if="errors.length">
      <ul>
        <li v-for="error in errors">{{error}}</li>
      </ul>
    </p>

    <section id="social-buttons">
      <button class="btn btn-outline-primary">Facebook</button>
      <button class="btn btn-outline-danger">Google</button>
      <button class="btn btn-outline-dark">Apple</button>
    </section>

    <section id="forgotten-pass">
      <a href="#">
        Olvidé mi contraseña
      </a>
    </section>
    
    <section>
      <input class="btn btn-secondary" type="submit" value="Iniciar sesión">
    </section>

  </form>

</template>

<style>
@import "@/assets/base.css";

#login-box {
  margin: auto;
  width: 20%;
  border: 3px solid black;
  padding: 50px;
}

#user-zone {
  padding-bottom: 30px;
}

#pass-zone {
  padding-bottom: 30px;
}

#social-buttons {
  padding-top: 30px;
  padding-bottom: 10px;
}

#forgotten-pass {
  padding-bottom: 20px;
}

</style>
