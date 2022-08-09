import { Login_Request } from "../out/generated_api"
import Service from "./service"

interface Tokens {
  token: string
  refreshToken: string
  expiresAt: Date
}

export default class AuthService extends Service {
  private _tokens?: Tokens

  public get tokens() {
    if (!this._tokens) return
    if (this._tokens.expiresAt < new Date()) {
      this._tokens = undefined
    }

    return this._tokens
  }

  constructor() {
    super()

    if (typeof window !== "undefined") {
      const tokens = localStorage.getItem("tokens")
      if (tokens) {
        this._tokens = JSON.parse(tokens)
      }
    }
  }

  async login(email: string, password: string): Promise<Tokens> {
    const body = new Login_Request({
      emailAddress: email,
      password: password
    })
    const response = await this.client.login(body)

    this._tokens = {
      token: response.result.token,
      refreshToken: response.result.refreshToken,
      // Set expiresAt to 15 min from now
      expiresAt: new Date(Date.now() + 15 * 60 * 1000)
    }

    if (typeof window !== "undefined") {
      localStorage.setItem("tokens", JSON.stringify(this._tokens))
    }

    return this._tokens
  }
}
