del = require 'del'

module.exports = (cb) ->
  del [
    'build'
    'dist'
    '.tmp'
    'trash'
  ], cb