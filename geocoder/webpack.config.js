const path = require('path')

module.exports = {
  entry: {
    main: path.resolve(__dirname, './lib/app.js'),
  },
  output: {
    path: path.resolve(__dirname, './dist'),
    filename: 'main.js'
  },
  mode: 'development'
}
