Grid = (require '/Users/giles/dev/mesh/lib/grid').Grid
Ball = (require '/Users/giles/dev/mesh/lib/ball').Ball

describe Grid, ->

  it 'creates a blank 7x7 grid on initialization', ->
    @grid = new Grid # TODO: fix wtf was wrong with beforeEach
    expect(@grid.rows.length).toEqual(7)
    for blank_row in @grid.rows
      expect(blank_row.length).toEqual(7)
    for blank_row in @grid.rows
      for index in blank_row
        expect(blank_row[index]).toEqual(null)

  it 'inserts a ball into the grid', ->
    @grid = new Grid # TODO: fix wtf was wrong with beforeEach
    @ball = new Ball
    @grid.insert @ball, 0
    expect(@grid.contents(0, 0)).toEqual(@ball)

  it 'fails loudly if you give it invalid arguments', ->
    # this is built into the Ruby implementation but in TODO: status for now
    # TODO: figure out analog to Exceptions

