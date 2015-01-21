echo = console.log
_ = require 'lodash'
gulp = require 'gulp'
{
  join
  basename
  extname
} = require 'path'

libs_obj =
  base: 'bower_components'
  files:
    'angularjs': 'angular.js'
    'bootstrap' : [
      'dist/css/bootstrap.css'
      'dist/fonts/glyphicons-halflings-regular.eot'
      'dist/fonts/glyphicons-halflings-regular.svg'
      'dist/fonts/glyphicons-halflings-regular.ttf'
      'dist/fonts/glyphicons-halflings-regular.woff'
    ]
    'jquery': 'dist/jquery.js'
    'angular-route': 'angular-route.js'
    'angular-resource': 'angular-resource.js'
    'angular-animate': 'angular-animate.js'

getlibfiles = (libs) ->
  {base} = libs
  {files} = libs
  libsArr = []

  for libname, libfiles of files
    if _.isArray libfiles
      for libfile in libfiles
        libsArr.push "#{base}/#{libname}/#{libfile}"
    else if _.isString libfiles
      libsArr.push "#{base}/#{libname}/#{libfiles}"
    else return

  libsArr

assetFilter = (libfiles) ->
  result =
    css: []
    js: []
    fonts: []
  for filepath in libfiles
    filename = basename filepath
    ext_name = extname filename
    if ext_name is '.css'
      result.css.push filepath
    else if ext_name is '.js'
      result.js.push filepath
    else if ext_name in ['.eot', '.svg', '.ttf', '.woff']
      result.fonts.push filepath
    else
      echo filepath
  result

module.exports = ->
  libs = assetFilter getlibfiles libs_obj
  gulp.src libs.css
  .pipe gulp.dest 'build/styles/libs'
  gulp.src libs.js
  .pipe gulp.dest 'build/scripts/libs'
  gulp.src libs.fonts
  .pipe gulp.dest 'build/styles/fonts'
