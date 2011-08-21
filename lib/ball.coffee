exports.Ball = class Ball
  constructor: (@value) ->
    @value ?= ':??'

  advance_state: ->
    switch @value
      when ':??'
        @value = ':?'
      when ':?'
        @value = Math.floor(Math.random() * 7) + 1

