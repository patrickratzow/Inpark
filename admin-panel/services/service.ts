import { Client } from "../out/generated_api"
import InparkClient from "./inpark_api"

export default class Service {
  protected client: Client

  public constructor(client?: Client) {
    this.client = client ?? InparkClient
  }
}
