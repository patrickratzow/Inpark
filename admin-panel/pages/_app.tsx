import '../styles/globals.css'
import type { AppProps } from 'next/app'
import process from 'process';

function MyApp({ Component, pageProps }: AppProps) {
  return <Component {...pageProps} />
}

if (typeof window == "undefined") {
  process.env["NODE_TLS_REJECT_UNAUTHORIZED"] = "0";
}

export default MyApp
