echo = console.log
gulp = require 'gulp'

module.exports = ->

  gulp.src [
    '.tmp/**/*.js'
    '.tmp/**/*.css'
    'build/**/data/**/*'
    'build/**/img/**/*'
    'build/**/styles/fonts/**/*'
  ]

  .pipe gulp.dest 'dist'