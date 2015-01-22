echo = console.log
gulp = require 'gulp'
gulpFilter = require 'gulp-filter'

inlineAngularTemplates = require 'gulp-inline-angular-templates'
usemin = require 'gulp-usemin'
minifyHTML = require 'gulp-minify-html'
minifyCSS = require 'gulp-minify-css'
uglify = require 'gulp-uglify'
rev = require 'gulp-rev'

tap = require 'gulp-tap'
watch = require 'gulp-watch'
browserSync = require 'browser-sync'

module.exports = ->

  gulp.src 'build/**/*.html'
  .pipe inlineAngularTemplates 'build/index.html',
    base: 'build'
    prefix: '/'
  .pipe usemin
    css: [
      minifyCSS
        keepBreaks: true
#        'concat'
#      rev()
    ]
    html: [
      minifyHTML
        comments: true
        spare: true
        empty: true
    ]
    js: [
      uglify()
#      rev()
    ]
  .pipe gulp.dest 'dist'
