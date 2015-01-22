runSequence = require 'run-sequence'

module.exports = ->

  runSequence 'prd'
  , 'ghpages'
