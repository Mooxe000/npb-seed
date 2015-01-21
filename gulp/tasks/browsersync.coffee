browserSync = require 'browser-sync'

module.exports = ->

  browserSync
    server:
      baseDir: './build'
    port: 9000
    index: 'index.html'
    startPath: '/'
    watchTask: true