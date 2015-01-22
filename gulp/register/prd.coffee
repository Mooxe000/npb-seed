require 'shelljs/global'

module.exports = ->

  for cmd in [
    'clean'
    'libs'
    'build'
    'useref'
    'dist_index'
    'dist_other'
    'dist_clean'
  ]
    exec "gulp #{cmd}"
