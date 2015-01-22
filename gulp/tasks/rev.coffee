gulp = require 'gulp'
rev = require 'gulp-rev'

module.exports = ->

  gulp.src 'dist/styles/*.css'
  .pipe rev()
  .pipe gulp.dest 'dist/styles'

  gulp.src 'dist/scripts/*.js'
  .pipe rev()
  .pipe gulp.dest 'dist/scripts'
