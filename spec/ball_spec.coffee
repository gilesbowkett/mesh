require '/Users/giles/dev/mesh/lib/array'
Ball = (require '/Users/giles/dev/mesh/lib/ball').Ball

describe Ball, ->
  it 'gradually reveals its numeric value', ->

    # one minor point of weirdness; the original version in Ruby went from :? to :?? to
    # numeric value. this version goes from :?? to :? to numeric value. I just think
    # it'll look better in the UI. TODO: maybe decouple the value from its representation,
    # i.e., have the state string be different from the way it looks in the UI. (this may
    # use graphics for that stuff anyway.)

    ball = new Ball
    expect(ball.value).toEqual('??')

    ball.advance_state()
    expect(ball.value).toEqual('?')

    ball.advance_state()
    expect(ball.value).toEqual(jasmine.any(Number))

