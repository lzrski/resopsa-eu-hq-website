gulp        = require 'gulp'
path        = require 'path'
_           = require 'lodash'
through     = require 'through2'
notify      = require 'gulp-notify'
rename      = require 'gulp-rename'

module.exports = (options = {}) ->
  _.defaults options,
    sources     : 'src/html/**/*.coffee'
    destination : 'build/public/'

  {
    sources
    destination
  } = options

  if typeof sources is 'string' then sources = [ sources ]
  sources = sources.map (dir) -> path.resolve __dirname, '..', dir
  destination = path.resolve __dirname, '..', destination


  gulp.task 'html', ->
    gulp
      .src sources, read: no
      .pipe through.obj (file, enc, done) ->
        # each file should be a module containing Teacup View instance
        # i.e. a function, that when called returns HTML string

        # Clear the cache, otherwise watch will always produce same output
        require.cache[file.path] = null
        try
          view = require file.path
          html = do view
        catch error
          return done error
        file.contents = new Buffer html
        @push file
        do done

      # TODO: Let main gulpfile deal with it
      .on 'error', notify.onError (error) ->
        console.error error.message
        console.error error.stack
        "Error compiling HTML form coffeescript: #{error.message}"

      .pipe rename extname: '.html'
      .pipe gulp.dest destination

  gulp.task 'watch-html', ['html'], ->
    gulp.watch sources, ['html']
