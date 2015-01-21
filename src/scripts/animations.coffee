phonecatAnimations = angular.module 'phonecatAnimations', ['ngAnimate']

phonecatAnimations

.animation '.phone', ->

  animateUp = (element, className, done) ->
    return unless className is 'active'

    element.css
      position: 'absolute'
      top: 500
      left: 0
      display: 'block'

    (
      jQuery element
    ).animate
      top: 0
    , done

    (cancel) ->
      if cancel then element.stop()

  animateDown = (element, className, done) ->
    return unless className is 'active'

    element.css
      position: 'absolute'
      top: 0
      left: 0

    (
      jQuery element
    ).animate
      top: -500
    , done

    (cancel) ->
      if cancel then element.stop()

  addClass: animateUp
  removeClass: animateDown
