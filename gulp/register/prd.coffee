runSequence = require 'run-sequence'

module.exports = ->

  runSequence 'clean'
  , 'libs', 'build'
  , 'useref'
  , 'dist_index', 'dist_other', 'dist_clean'
