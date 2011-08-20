Array::sequence = ->
  true

Array::ball_value_matches_subsequence_size = (ball) ->
  ball.number == (@subsequence ball.number).length

Array::subsequence = (ball) ->
  @biggest_subsequence = []
  for first in [0..6]
    for last in [0..6]
      current_subsequence = this[first..last]
      unless null in current_subsequence or 0 == current_subsequence.length
        if ball in current_subsequence and @biggest_subsequence.length < current_subsequence.length
          @biggest_subsequence = this[first..last]
  @biggest_subsequence

