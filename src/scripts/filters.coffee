phonecatFilters = angular.module 'phonecatFilters', []

phonecatFilters
.filter 'checkmark', ->
  (input) ->
    if input
    then '\u2713'
    else '\u2718'