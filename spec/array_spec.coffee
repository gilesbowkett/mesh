require '/Users/giles/dev/mesh/lib/array'
Ball = (require '/Users/giles/dev/mesh/lib/ball').Ball

describe Array, ->

  it 'has the right methods', ->
    expect([].sequence?).toBeTruthy()
    expect([].subsequence?).toBeTruthy()
    expect([].sequence?).toBeTruthy()

  it 'recognizes subsequences', ->
    expect([1, 2, 3, 4, null, null, null].subsequence 4).toEqual([1, 2, 3, 4])
    expect([4, 4, 4, 4, null, null, null].subsequence 4).toEqual([4, 4, 4, 4])
    expect([null, null, null, 1, 2, 3, 4].subsequence 4).toEqual([1, 2, 3, 4])
    expect([null, 1, 2, 3, 4, null, null].subsequence 4).toEqual([1, 2, 3, 4])

    expect([null, 1, 2, 3, null, 7, 3].subsequence 3).toEqual([1, 2, 3])

  it 'matches Ball value to Array size', ->
    row = [null, null, null, null, null, null, 1]
    ball = new Ball 1
    expect(row.sequence(ball)).toBeTruthy()

    row = [null, 1, 2, 3, 4, null, null]
    ball = new Ball 4
    expect(row.sequence(ball)).toBeTruthy()

