Grid = (require '/Users/giles/dev/mesh/lib/grid').Grid

describe Grid, ->

  it 'creates a blank 7x7 grid on initialization', ->
    @grid = new Grid
    expect(@grid.rows.length).toEqual(7)
    for blank_row in @grid.rows
      expect(blank_row.length).toEqual(7)
    for blank_row in @grid.rows
      for index in blank_row
        expect(blank_row[index]).toEqual(null)

