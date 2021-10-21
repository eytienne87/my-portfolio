const path = require('path')
const Dotenv = require('dotenv-webpack');

module.exports = {
  entry: {
    main: path.resolve(__dirname, './lib/app.js'),
  },
  output: {
    path: path.resolve(__dirname, './dist'),
    filename: 'main.js'
  },
  mode: 'development',
  plugins: [
    new Dotenv()
  ]
}
