import axios from "axios";
import { useStore as useAuthStore } from "./stores/auth";

export const useAxios = () => {
  const authStore = useAuthStore();

  return axios.create({
    baseURL: `http://localhost:3001/`,
    headers: authStore.isLogged
      ? {
          Authorization: `Bearer ${authStore.token}`,
        }
      : {},
  });
};
