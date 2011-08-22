# in the earlier Ruby version, this class revolves around its own @grid instance variable,
# which is obviously a code smell. @grid represents a set of rows, so this time around it's
# called @rows.

exports.Grid = class Grid
  constructor: ->
    # set up 7x7 grid (I'm hoping more idiomatic techniques exist)
    blank_row = []
    (blank_row.push null) for index in [0..6]
    @rows = []
    @rows[index] = blank_row for index in [0..6]

