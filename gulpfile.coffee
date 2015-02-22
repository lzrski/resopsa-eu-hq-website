path = require 'path'

# Tasks are modularized
html = require './gulpfile.d/html'

html
  sources     : path.resolve __dirname, 'src/html/**/*.coffee'
  destination : path.resolve __dirname, 'build/public/'
