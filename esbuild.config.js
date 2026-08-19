import build from "./config/esbuild.defaults.js"

// Update this if you need to configure a destination folder other than `output`
const outputFolder = "output"

// You can customize this as you wish, perhaps to add new esbuild plugins.
//
// ```
// const path = require("path")
// const esbuildCopy = require('esbuild-plugin-copy').default
// const esbuildOptions = {
//   plugins: [
//     esbuildCopy({
//       assets: {
//         from: [path.resolve(__dirname, 'node_modules/somepackage/files/*')],
//         to: [path.resolve(__dirname, 'output/_bridgetown/somepackage/files')],
//       },
//       verbose: false
//     }),
//   ]
// }
// ```
//
// You can also support custom base_path deployments via changing `publicPath`.
//
// ```
// const esbuildOptions = { publicPath: "/my_subfolder/_bridgetown/static" }
// ```

/**
 * @typedef { import("esbuild").BuildOptions } BuildOptions
 * @type {BuildOptions}
 */
const esbuildOptions = {
  // The defaults emit sourcemaps unconditionally, and `keep_history` on the
  // gh-pages deploy meant every build's .css.map/.js.map accumulated on the
  // branch — 578 KB apiece, published, and useful to nobody in production.
  sourcemap: process.env.BRIDGETOWN_ENV !== "production",
}

build(outputFolder, esbuildOptions)
