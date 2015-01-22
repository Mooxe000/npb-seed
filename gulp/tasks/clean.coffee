echo = console.log
{error} = console
del = require 'del'

module.exports = ->
  del [
    'build'
    'dist'
    '.tmp'
    'trash'
  ], (err, deletedFiles) ->
    if err
      error err
      return
    else if deletedFiles.length > 0
      echo """
      Files deleted:
      #{deletedFiles.join '\n'}
      """
    else return
