gulp        = require 'gulp'
path        = require 'path'
del         = require 'del'
sequence    = require 'run-sequence'

# Tasks are modularized
do require './gulpfile.d/html'
do require './gulpfile.d/assets'

gulp.task 'clean', (done) -> del 'build/*', done

gulp.task 'default', -> sequence 'clean', 'assets', 'html'
