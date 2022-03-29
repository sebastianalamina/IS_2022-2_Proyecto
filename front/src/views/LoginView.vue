<script>
</script>

<template>

  <div id="login-box">

    <section id="user-area">
      <label>Usuario</label>
      <input type="text" class="form-control">
    </section>

    <section id="pass-area">
      <label>Contraseña</label>
      <input type="text" class="form-control">
    </section>

    <section id="social-buttons">
      <button>Facebook</button>
      <button>Google</button>
      <button>Apple</button>
    </section>

    <section id="forgotten-pass">
      <a href="#">
        Olvidé mi contraseña
      </a>
    </section>
    
    <section>
      <button type="submit">Login</button>
    </section>

  </div>

</template>

<style>
@import "@/assets/base.css";

#login-box {
  margin: auto;
  width: 20%;
  border: 3px solid black;
  padding: 50px;
}

#user-area {
  padding-bottom: 30px;
}

#pass-area {
  padding-bottom: 60px;
}

#social-buttons {
  padding-bottom: 10px;
}

#forgotten-pass {
  padding-bottom: 20px;
}

</style>
