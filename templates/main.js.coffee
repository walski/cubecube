class Cube
  constructor: (@element) ->
    @_roll = 0
    @_yaw = 0
    @_pitch = 0
    @_size = 100
    @_text = 'Hello World'

  setTransform: =>
    @element.css('transform', "rotateY(#{@_yaw}deg) rotateX(#{@_pitch}deg) rotateZ(#{@_roll}deg)")

  setSize: =>
    size = {width: @_size, height: @_size}
    @element.css(size)
    @element.find('.cube-outer').css('transform', "translate3d(#{@_size/2}px, #{@_size/2}px, 0")
    @element.find('.cube-inner').css('transform', "translate3d(0,0, #{@_size/2}px)")
    @faces().css(size)
    @element.find(".cube-face:nth-child(4)").css('transform', "translate3d(0, 0, #{-1 * @_size}px)")
    @element.find(".cube-face:nth-child(5)").css('transform', "rotateX(90deg) translate3d(0, #{-1 * (@_size / 2)}px, #{@_size / 2}px)")
    @element.find(".cube-face:nth-child(6)").css('transform', "rotateX(90deg) translate3d(0, #{-1 * (@_size / 2)}px, #{-1 * (@_size / 2)}px)")

  setText: =>
    @faces().text(@_text)

  faces: =>
    @element.find('.cube-face')

  roll: (roll) =>
    @_roll = roll
    @setTransform()

  pitch: (pitch) =>
    @_pitch = pitch
    @setTransform()

  yaw: (yaw) =>
    @_yaw = yaw
    @setTransform()

  size: (size) =>
    @_size = size
    @setSize()

  text: (text) =>
    @_text = text
    @setText()


$ ->
  cube = new Cube($('.cube'))

  $('.cube-control').on 'change', ->
    slider = $(@)
    cube[slider.data('control')](slider.val())
