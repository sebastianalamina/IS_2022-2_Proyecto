import axios from "axios";
import { useStore as useAuthStore } from "./stores/auth";

export const useAxios = () => {
  const authStore = useAuthStore();
  const baseURL = "http://" + document.location.host.split(":")[0] + ":3001";

  return axios.create({
    baseURL: `${baseURL}`,
    headers: authStore.isLogged
      ? {
          Authorization: `Bearer ${authStore.token}`,
        }
      : {},
  });
};
