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
    # TODO: figure out analog to Exceptions

  it 'avoids "collisions" on insert', ->
    @grid = new Grid # TODO: fix wtf was wrong with beforeEach
    @ball = new Ball 1
    @ball2 = new Ball 2

    @grid.insert @ball, 0
    @grid.insert @ball2, 0

    expect(@grid.contents(0, 0)).toEqual(@ball)
    expect(@grid.contents(0, 1)).toEqual(@ball2)
    expect(@grid.contents(0, 2)).toEqual(null)

  it 'accesses by column', ->
    @grid = new Grid # TODO: fix wtf was wrong with beforeEach
    @ball = new Ball
    @grid.insert @ball, 0
    expect(@grid.column(0)).toEqual([@ball, null, null, null, null, null, null])

  it 'clears columns', ->
    @grid = new Grid # TODO: fix wtf was wrong with beforeEach
    @ball = new Ball

    @grid.insert @ball, 0
    expect(@grid.column(0)).toEqual([@ball, null, null, null, null, null, null])

    @grid.clear_column(0)
    expect(@grid.column(0)).toEqual([null, null, null, null, null, null, null])

  it 'simulates gravity (by dropping a column through a null)', ->
    @grid = new Grid # TODO: fix wtf was wrong with beforeEach
    @ball = new Ball

    for digit in [0..6]
      @grid.insert eval("ball_#{digit} = new Ball(#{digit})"), 0
    @grid.rows[0][0] = null
    expect(@grid.column 0).toEqual([null, ball_1, ball_2, ball_3, ball_4, ball_5, ball_6])

    @grid.gravity()
    expect(@grid.column 0).toEqual([ball_1, ball_2, ball_3, ball_4, ball_5, ball_6, null])

  it 'simulates gravity (by dropping balls thru multiple nulls)', ->
    @grid = new Grid # TODO: fix wtf was wrong with beforeEach
    @ball = new Ball

    for digit in [0..6]
      @grid.insert eval("ball_#{digit} = new Ball(#{digit})"), 0
    @grid.rows[0][0] = @grid.rows[2][0] = @grid.rows[3][0] = @grid.rows[5][0] = null
    expect(@grid.column 0).toEqual([null, ball_1, null, null, ball_4, null, ball_6])

    @grid.gravity()
    expect(@grid.column 0).toEqual([ball_1, ball_4, ball_6, null, null, null, null])

