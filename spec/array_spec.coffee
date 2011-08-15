# this has to go a little bit differently than it would in Ruby, A) because monkey-
# patching seems more of a PITA, and B) because the require/exports system is different

# I may even need to create a Sequence object, or a Row or something

describe Array, ->
  beforeEach ->
    @addMatchers {
      toBeSequence: -> true == @actual.sequence()
    }

  it 'recognizes subsequences', ->
    expect([1, 2, 3, 4, null, null, null].subsequence 4).toEqual([1, 2, 3, 4])
    expect([null, null, null, 1, 2, 3, 4].subsequence 4).toEqual([1, 2, 3, 4])
    expect([null, 1, 2, 3, 4, null, null].subsequence 4).toEqual([1, 2, 3, 4])
    expect([null, 1, 2, 3, null, 7, 3].subsequence 3).toEqual([1, 2, 3])
    expect([4, 4, 4, 4, null, null, null].subsequence 4).toEqual([4, 4, 4, 4])
    # does this code cover things like [1, 2, null, null, null, 1, 2].subsequence 2 ?
    # in practice I know I've done that in games and had it work, but I'm not sure why

  it 'recognizes sequences', ->
    b4 = new Ball 4
    any = new Ball

    expect([b4, any, any, any, null, null, null]).toBeSequence()
    expect([b4, any, null, any, null, any, null]).not.toBeSequence()

