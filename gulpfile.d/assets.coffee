gulp    = require 'gulp'
_       = require 'lodash'
through = require 'through2'
notify  = require 'gulp-notify'
rename  = require 'gulp-rename'
path    = require 'path'

module.exports = (options = {}) ->
  _.defaults options,
    sources     : [
      'assets/**/*'
      'bower_components/**/*'
    ]
    destination : 'build/public/'

  {
    sources
    destination
  } = options

  if typeof sources is 'string' then sources = [ sources ]
  sources = sources.map (dir) -> path.resolve __dirname, '..', dir
  destination = path.resolve __dirname, '..', destination

  gulp.task 'assets', ->
    gulp
      .src sources
      .pipe gulp.dest destination

  gulp.task 'watch-assets', ['assets'], ->
    gulp.watch sources, ['assets']
