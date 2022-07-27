import Link from 'next/link';
import { useRouter } from 'next/router';
import styles from '../styles/Home.module.css'
import Image from 'next/image'

export default function Layout({ children }: any) {
  const router = useRouter();

  const menuItems = [
    {
      href: '/',
      title: 'Start side',
    },
    {
      href: '/animals',
      title: 'Dyr',
    },
  ];

  return (
    <div className='min-h-screen flex flex-col'>
      <header className='flex items-center px-4 py-2 bg-green-100'>
      <Image src="/logo.png" alt="Inpark" width={140} height={50} />
      <div className='mx-auto' >
                Inpark admin panel
      </div>
      </header>
      <div className='flex flex-col md:flex-row flex-1'>
        <aside className='bg-green-100 w-full md:w-60'>
          <nav>
            <ul>
              {menuItems.map(({ href, title }) => (
                <li className='m-2' key={title}>
                  <Link href={href}>
                    <a
                      className={`flex p-2 bg-green-200 rounded hover:bg-green-400 cursor-pointer ${
                        router.asPath === href && 'bg-green-600 text-black'
                      }`}
                    >
                      {title}
                    </a>
                  </Link>
                </li>
              ))}
            </ul>
          </nav>
        </aside>
        <main className='flex-1'>{children}</main>
      </div>
      <footer className={styles.footer}>
          Made by Zeta
      </footer>
    </div>
  );
}
