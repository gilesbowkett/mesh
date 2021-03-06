Grid = (require '/Users/giles/dev/mesh/lib/grid').Grid
Ball = (require '/Users/giles/dev/mesh/lib/ball').Ball

describe Grid, ->
  beforeEach ->
    @grid = new Grid
    @ball = new Ball

  it 'creates a blank 7x7 grid on initialization', ->
    expect(@grid.rows.length).toEqual(7)
    for blank_row in @grid.rows
      expect(blank_row.length).toEqual(7)
      for index in blank_row
        expect(blank_row[index]).toEqual(null)

  describe 'simple inserts', ->
    beforeEach ->
      @grid.insert @ball, 0

    it 'inserts a ball into the grid', ->
      expect(@grid.contents(0, 0)).toEqual(@ball)

    it 'avoids "collisions" on insert', ->
      @ball2 = new Ball 2
      @grid.insert @ball2, 0

      expect(@grid.contents(0, 0)).toEqual(@ball)
      expect(@grid.contents(0, 1)).toEqual(@ball2)
      expect(@grid.contents(0, 2)).toEqual(null)

    it 'accesses by column', ->
      expect(@grid.column(0)).toEqual([@ball, null, null, null, null, null, null])

    it 'clears columns', ->
      expect(@grid.column(0)).toEqual([@ball, null, null, null, null, null, null])
      @grid.clear_column(0)
      expect(@grid.column(0)).toEqual([null, null, null, null, null, null, null])

    it 'checks cleared status', ->
      expect(@grid.isCleared()).toBeFalsy()
      @grid.rows[0][0] = null
      expect(@grid.isCleared()).toBeTruthy()

  describe 'simulating gravity', ->
    beforeEach ->
      for digit in [0..6]
        @grid.insert eval("ball_#{digit} = new Ball(#{digit})"), 0

    it 'simulates gravity (by dropping a column through a null)', ->
      @grid.rows[0][0] = null
      expect(@grid.column 0).toEqual([null, ball_1, ball_2, ball_3, ball_4, ball_5, ball_6])

      @grid.gravity()
      expect(@grid.column 0).toEqual([ball_1, ball_2, ball_3, ball_4, ball_5, ball_6, null])

    it 'simulates gravity (by dropping balls thru multiple nulls)', ->
      @grid.rows[0][0] = @grid.rows[2][0] = @grid.rows[3][0] = @grid.rows[5][0] = null
      expect(@grid.column 0).toEqual([null, ball_1, null, null, ball_4, null, ball_6])

      @grid.gravity()
      expect(@grid.column 0).toEqual([ball_1, ball_4, ball_6, null, null, null, null])

  describe 'exploding', ->
    it 'initializes with zero balls tagged to explode', ->
      expect(@grid.tagged_to_explode).toEqual([])

    it 'tags balls to explode', ->
      fake_array = {}
      fake_array.sequence = (ball) => return true
      @grid.checkExplosion(@ball, fake_array, 0, 0)

      expect(@grid.tagged_to_explode).toEqual([[0, 0]])
      # ugh, is this really how I built this? that shit is awful. the ball should be tagged
      # to explode and simply know its own coordinates. this echoes the Ruby code precisely,
      # but it's pretty fucking clear that the Ruby code was fucked.

    it 'calculates explosions vertically', -> # this probably becomes nested description
      # Grid#explode_vertical
      process.stdout.write 'p'
    it 'calculates explosions horizontally', -> # this probably becomes nested description
      # Grid#explode_horizontal
      process.stdout.write 'p'
    it 'sets exploded balls null', ->
      # Grid#kaboom()
      process.stdout.write 'p'
    it 'distributes explosion side effects', ->
      # Grid#blowback
      process.stdout.write 'p'

