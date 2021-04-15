import dts from 'rollup-plugin-dts';

module.exports = [
  {
    input: './out/debug/index.d.ts',
    output: {
      file: './out/release/index.d.ts',
      format: 'es',
    },
    plugins: [dts()],
  },
];
