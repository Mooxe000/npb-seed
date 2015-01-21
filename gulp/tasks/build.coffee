echo = console.log
gulp = require 'gulp'
gulpFilter = require 'gulp-filter'

coffee = require 'gulp-coffee'
jade = require 'gulp-jade'
stylus = require 'gulp-stylus'

tap = require 'gulp-tap'
watch = require 'gulp-watch'
browserSync = require 'browser-sync'

module.exports = ->

  jadeFilter = gulpFilter ['**/*.jade']
  stylusFilter = gulpFilter ['**/*.styl']
  coffeeFilter = gulpFilter ['**/*.coffee']

  gulp.src 'src/**/*'

  # reload for file changed
#  .pipe watch src_path_arr, ->
#    browserSync.reload()

  # jade
  .pipe jadeFilter
  .pipe jade
    pretty: true
    locals: {}
  .pipe jadeFilter.restore()

  # stylus
  .pipe stylusFilter
  .pipe stylus()
  .pipe stylusFilter.restore()

  # coffee
  .pipe coffeeFilter
  .pipe coffee
    bare: true
  .pipe coffeeFilter.restore()

  # browserSync
  .pipe browserSync.reload stream:true

  # dest
  .pipe gulp.dest 'build'

# reload for file changed
#  .pipe watch src_path_arr, ->
#    browserSync.reload()
