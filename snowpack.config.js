/** @type {import("snowpack").SnowpackUserConfig } */
module.exports = {
  mount: {
    public: { url: '/', static: true },
    src: { url: '/dist' },
  },
  plugins: [
    '@snowpack/plugin-webpack',
    '@snowpack/plugin-babel',
    ['@snowpack/plugin-sass', {
      native: true,
      compilerOptions: {
        style: 'compressed',
      },
    }],
    ['snowpack-plugin-raw-file-loader', {
      exts: ['.glsl'],
    }],
  ],
  devOptions: {
    port: 3333,
  },
};
