import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  output: 'standalone',
  serverRuntimeConfig: {
    host: '0.0.0.0',
  },

};

export default nextConfig;
