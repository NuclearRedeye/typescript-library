import dts from 'rollup-plugin-dts';
import { terser } from 'rollup-plugin-terser';
module.exports = [
  {
    input: 'build/index.js',
    output: {
      file: 'dist/lib/typescript-library.js',
      format: 'es',
    },
  },
  {
    input: 'build/index.js',
    output: {
      file: 'dist/lib/typescript-library.min.js',
      format: 'es',
    },
    plugins: [terser()],
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
