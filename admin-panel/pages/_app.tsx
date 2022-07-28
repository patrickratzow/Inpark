import '../styles/globals.css'
import type { AppProps } from 'next/app'
import process from 'process';
import React, { ReactElement, ReactNode, useEffect } from 'react';
import Layout from '../components/layout';
import { NextPage } from 'next';

export type NextPageWithLayout = NextPage & {
  getLayout?: (page: ReactElement) => ReactNode
}

type AppPropsWithLayout = AppProps & {
  Component: NextPageWithLayout
}

function MyApp({ Component, pageProps }: AppPropsWithLayout) {
  useEffect(() => {
    if (localStorage.getItem('sidebar-expanded') == 'true') {
      document.querySelector('body')!.classList.add('sidebar-expanded');
  } else {
      document.querySelector('body')!.classList.remove('sidebar-expanded');
  }
  }, [])

  // Use the layout defined at the page level, if available
  const getLayout = Component.getLayout ?? ((page) => <Layout>{page}</Layout>)

  return getLayout(<Component {...pageProps} />)
}


if (typeof window == "undefined") {
  process.env["NODE_TLS_REJECT_UNAUTHORIZED"] = "0";
}

export default MyApp
