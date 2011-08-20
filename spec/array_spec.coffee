require '/Users/giles/dev/mesh/lib/array'
Ball = require ('/Users/giles/dev/mesh/lib/ball').Ball

describe Array, ->
  beforeEach ->
    @addMatchers {
      toBeSequence: -> true == @actual.sequence()
    }

  it 'recognizes subsequences', ->
    expect([1, 2, 3, 4, null, null, null].subsequence 4).toEqual([1, 2, 3, 4])
    expect([4, 4, 4, 4, null, null, null].subsequence 4).toEqual([4, 4, 4, 4])
    expect([null, null, null, 1, 2, 3, 4].subsequence 4).toEqual([1, 2, 3, 4])
    expect([null, 1, 2, 3, 4, null, null].subsequence 4).toEqual([1, 2, 3, 4])

    expect([null, 1, 2, 3, null, 7, 3].subsequence 3).toEqual([1, 2, 3])

  it 'recognizes sequences', ->
    b4 = new Ball 4
    any = new Ball

    # expect([b4, any, any, any, null, null, null]).toBeSequence()
    # expect([b4, any, null, any, null, any, null]).not.toBeSequence()

