import { Client } from "../out/generated_api"
import axios, { AxiosInstance, AxiosRequestConfig } from "axios"

const config: AxiosRequestConfig = {
  baseURL: "https://localhost:5000"
}
const client: AxiosInstance = axios.create(config)

client.interceptors.request.use(async config => {
  const token = localStorage.getItem("token")
  if (token) {
    config.headers = {
      ...config.headers,
      Authorization: `Bearer ${token}`
    }
  }

  return config
})

// Create an interceptor for response that on 403 response will attempt to refresh login using the stored refresh token
// If there is a 400 error then the user is logged out
// If there is no refresh token then the user is logged out
// If there is a 200 response then the user is logged in, and the refresh token is stored in local storage
client.interceptors.response.use(
  async response => {
    if (response.status === 200) {
      const token = response.data.token
      localStorage.setItem("token", token)
    }
    return response
  },
  async error => {
    if (error.response.status === 403) {
      const refreshToken = localStorage.getItem("refreshToken")
      if (refreshToken) {
        const response = await client.post("/admin/user/refresh-login", { refreshToken })
        const token = response.data.token
        localStorage.setItem("token", token)

        return client(error.config)
      }
    } else if (error.response.status === 400) {
      localStorage.removeItem("token")
      localStorage.removeItem("refreshToken")
    }

    return Promise.reject(error)
  }
)

const apiClient = new Client(config.baseURL, client)

export default apiClient
