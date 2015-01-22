echo = console.log
gulp = require 'gulp'

inlineAngularTemplates = require 'gulp-inline-angular-templates'
minifyHTML = require 'gulp-minify-html'

module.exports = ->

  gulp.src [
    '.tmp/**/*.html'
  ]

  # inline Angular
  .pipe inlineAngularTemplates '.tmp/index.html',
    base: '.tmp'
    prefix: '/'

  .pipe minifyHTML
    comments: true
    spare: true
    empty: true

  .pipe gulp.dest 'dist'