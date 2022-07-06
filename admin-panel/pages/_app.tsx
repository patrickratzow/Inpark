import '../styles/globals.css'
import type { AppProps } from 'next/app'
import process from 'process';
import { useEffect } from 'react';
import Layout from '../components/layout';

function MyApp({ Component, pageProps }: AppProps) {
  //Probably delete
  useEffect(() => {
    if (localStorage.getItem('sidebar-expanded') == 'true') {
      document.querySelector('body')!.classList.add('sidebar-expanded');
  } else {
      document.querySelector('body')!.classList.remove('sidebar-expanded');
  }
  }, [])

  return (
    <Layout>
          <Component {...pageProps} />
    </Layout>
  );
}


if (typeof window == "undefined") {
  process.env["NODE_TLS_REJECT_UNAUTHORIZED"] = "0";
}

export default MyApp
