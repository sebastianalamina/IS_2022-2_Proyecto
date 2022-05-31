import axios from "axios";
import { useStore as useAuthStore } from "./stores/auth";

export const useAxios = () => {
  const authStore = useAuthStore();
  console.log(import.meta.env.VITE_API_ENDPOINT);

  return axios.create({
    baseURL: `${import.meta.env.VITE_API_ENDPOINT}`,
    headers: authStore.isLogged
      ? {
          Authorization: `Bearer ${authStore.token}`,
        }
      : {},
  });
};
