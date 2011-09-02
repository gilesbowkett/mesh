# in the earlier Ruby version, this class revolved around its own @grid instance variable,
# which is obviously a code smell. @grid represents a set of rows, so this time around it's
# called @rows.

exports.Grid = class Grid
  constructor: ->
    @tagged_to_explode = []
    @rows = []
    for x in [0..6]
      @rows[x] = []
      for y in [0..6]
        @rows[x][y] = null

  column: (index) ->
    column = []
    for row in @rows
      column.push(row[index])
    column

  insert: (ball, column) ->
    for row in @rows when row[column] is null
      row[column] = ball
      return

  contents: (x, y) ->
    @rows[y][x]

  clear_column: (column_number) ->
    for row_number in [0..6]
      @rows[row_number][column_number] = null

  gravity: ->
    for column_number in [0..6]
      balls = @column(column_number).collapse()
      @clear_column(column_number)
      for ball in balls
        @insert(ball, column_number)

  isCleared: ->
    0 == @rows.flatten().compact().length

