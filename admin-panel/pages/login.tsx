import Image from "next/image";
import React, { ReactElement, useEffect, useState } from "react";
import useService from "../hooks/use_service";
import AuthService from "../services/auth.service";
import { NextPageWithLayout } from "./_app";

const height = 64;
const Login: NextPageWithLayout = () => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [rememberMe, setRememberMe] = useState(false);
  const authService = useService(AuthService);
  const [isLoggedIn, setIsLoggedIn] = useState(authService.tokens == null);

  useEffect(() => {
    setIsLoggedIn(authService.tokens == null);
  }, [authService.tokens]);

  function submitLogin(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();

    authService.login(email, password);
    console.log(email, password, rememberMe);
  }

  return (
    <>
      <div className="min-h-full h-full flex">
        <div className="flex-1 flex flex-col justify-center py-12 px-4 sm:px-6 lg:flex-none lg:px-20 xl:px-24">
          <div className="mx-auto w-full max-w-sm lg:w-96">
            <div>
              <Image
                layout="fixed"
                className="h-12 w-auto"
                src="/logo.svg"
                alt="Inpark logo"
                width={height * 2.25}
                height={height}
              />
              <h2 className="text-3xl font-extrabold text-gray-900">Log ind på din bruger</h2>
              <p className="mt-2 text-sm text-gray-600">
                Eller{' '}
                <a href="#" className="font-medium text-indigo-600 hover:text-indigo-500">
                  kontakt os for at høre mere
                </a>
              </p>
            </div>

            <div className="mt-2">
                <div className="mt-6 relative">
                  <div className="absolute inset-0 flex items-center" aria-hidden="true">
                    <div className="w-full border-t border-gray-300" />
                  </div>
                  <div className="relative flex justify-center text-sm">
                  </div>
                </div>

              <div className="mt-6">
                <form action="#" method="POST" className="space-y-6" onSubmit={submitLogin}>
                  <div>
                    <label htmlFor="email" className="block text-sm font-medium text-gray-700">
                      Email addresse
                    </label>
                    <div className="mt-1">
                      <input
                        id="email"
                        name="email"
                        type="email"
                        autoComplete="email"
                        required
                        value={email}
                        onChange={(e) => setEmail(e.target.value)}
                        className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                      />
                    </div>
                  </div>

                  <div className="space-y-1">
                    <label htmlFor="password" className="block text-sm font-medium text-gray-700">
                      Kodeord
                    </label>
                    <div className="mt-1">
                      <input
                        id="password"
                        name="password"
                        type="password"
                        autoComplete="current-password"
                        required
                        value={password}
                        onChange={(e) => setPassword(e.target.value)}
                        className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                      />
                    </div>
                  </div>

                  <div className="flex items-center justify-between">
                    <div className="flex items-center">
                      <input
                        id="remember-me"
                        name="remember-me"
                        type="checkbox"
                        checked={rememberMe}
                        onChange={(e) => setRememberMe(e.target.checked)}
                        className="h-4 w-4 text-indigo-600 focus:ring-indigo-500 border-gray-300 rounded"
                      />
                      <label htmlFor="remember-me" className="ml-2 block text-sm text-gray-900">
                        Husk mig
                      </label>
                    </div>

                    <div className="text-sm">
                      <a href="#" className="font-medium text-indigo-600 hover:text-indigo-500">
                        Glemt dit kodeord?
                      </a>
                    </div>
                  </div>

                  <div>
                    <button
                      type="submit"
                      className="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                    >
                      Log ind
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <div className="hidden lg:block relative w-0 flex-1">
          <img
            className="absolute inset-0 h-full w-full object-cover"
            src="https://cms.aalborgzoo.dk/media/xy4hhjc3/l%C3%B8ve1920x900.jpg?width=1920"
            alt=""
          />
        </div>
      </div>
    </>
  )
}

Login.getLayout = function getLayout(page: ReactElement) {
  return page;
}

export default Login