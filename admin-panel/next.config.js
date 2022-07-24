/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  images: {
    domains: ['cms.aalborgzoo.dk'],
  },
  plugins: [
    require('@tailwindcss/forms'),
  ]
}

module.exports = nextConfig
