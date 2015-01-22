echo = console.log
gulp = require 'gulp'
ghpages = require 'gulp-gh-pages'

module.exports = ->
  gulp
  .src "dist/**/*"
  .pipe ghpages()