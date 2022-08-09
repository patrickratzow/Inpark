import { useMemo } from "react"
import { Client } from "../out/generated_api"
import InparkClient from "../services/inpark_api"
import Service from "../services/service"

export default function useService<T extends Service>(type: { new (client?: Client): T }, client?: Client): T {
  const resolvedClient = client ?? InparkClient
  const service = useMemo(() => new type(resolvedClient), [type, resolvedClient])

  return service
}
