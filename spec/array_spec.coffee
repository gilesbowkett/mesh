class Ball

Array::sequence = ->
  true

describe Array, ->
  beforeEach ->
    @addMatchers { toBeSequence: -> true == @actual.sequence() }

  it 'recognizes sequences', ->
    b4 = new Ball 4
    any = new Ball

    expect([b4, any, any, any, null, null, null]).toBeSequence()
    # expect([b4, any, null, any, null, any, null]).not.toBeSequence()
    

