# in the earlier Ruby version, this class revolved around its own @grid instance variable,
# which is obviously a code smell. @grid represents a set of rows, so this time around it's
# called @rows.

exports.Grid = class Grid
  constructor: ->
    # set up 7x7 grid (I'm hoping more idiomatic techniques exist)
    blank_row = []
    blank_row.push null for index in [0..6]
    @rows = []
    @rows[index] = blank_row for index in [0..6]

  column: (index) ->
    column = []
    for row in @rows
      column.push(row[index])
    column

  insert: (ball, column) ->
    inserted = false
    for row in @rows
      break unless row[column]
    row[column] = ball

  contents: (x, y) ->
    @rows[y][x]

