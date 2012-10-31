class Cube
  constructor: (@element) ->
    @_roll = 0
    @_yaw = 0
    @_pitch = 0

  setTransform: =>
    @element.css('transform', "rotateY(#{@_yaw}deg) rotateX(#{@_pitch}deg) rotateZ(#{@_roll}deg)")

  roll: (roll) =>
    @_roll = roll
    @setTransform()

  pitch: (pitch) =>
    @_pitch = pitch
    @setTransform()

  yaw: (yaw) =>
    @_yaw = yaw
    @setTransform()

$ ->
  cube = new Cube($('.cube'))

  $('.slider').on 'change', ->
    slider = $(@)
    cube[slider.data('control')](slider.val())
