echo = console.log
gulp = require 'gulp'
gulpFilter = require 'gulp-filter'

useref = require 'gulp-useref'
minifyCSS = require 'gulp-csso'
uglify = require 'gulp-uglify'

rev = require 'gulp-rev'
revReplace = require 'gulp-rev-replace'

module.exports = ->

  jsFilter = gulpFilter '**/*.js'
  cssFilter = gulpFilter '**/*.css'
  htmlFilter = gulpFilter '**/*.html'

  userefAssets = useref.assets()

  gulp.src [
    'build/**/*.html'
  ]

  .pipe htmlFilter

  .pipe userefAssets

  # js
  .pipe jsFilter
  .pipe uglify()
  .pipe jsFilter.restore()

  # css
  .pipe cssFilter
  .pipe minifyCSS()
  .pipe cssFilter.restore()

  .pipe rev()

  .pipe userefAssets.restore()

  .pipe useref()
  .pipe revReplace()

  .pipe htmlFilter.restore()

  .pipe gulp.dest '.tmp'