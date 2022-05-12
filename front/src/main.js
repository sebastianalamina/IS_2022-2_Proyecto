import { createApp } from "vue";
import { createPinia } from "pinia";
import piniaPluginPersistedstate from "pinia-plugin-persistedstate";

import { VuesticPlugin, mergeGlobalConfig } from "vuestic-ui";
import "vuestic-ui/dist/vuestic-ui.css";

import App from "./App.vue";
import router from "./router";

mergeGlobalConfig({
  colors: {
    primary: "#084887",
    secondary: "#f58a07",
    info: "#f9ab55",
  },
});

const app = createApp(App);

const pinia = createPinia();
pinia.use(piniaPluginPersistedstate);

app.use(pinia);
app.use(VuesticPlugin);
app.use(router);

app.mount("#app");
