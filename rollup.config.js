import dts from 'rollup-plugin-dts';
module.exports = [
  {
    input: 'build/index.js',
    output: {
      file: 'dist/lib/typescript-library.js',
      format: 'es',
    },
  },
  {
    input: './build/index.d.ts',
    output: {
      file: 'dist/lib/typescript-library.d.ts',
      format: 'es',
    },
    plugins: [dts()],
  },
];
