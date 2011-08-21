# do we have a sequence matching the rules of the game?
Array::sequence = (ball) ->
  ball.value == (@subsequence ball.value).length

# do we have a subset in the total set which qualifies as explodable?
Array::subsequence = (ball) ->
  @biggest_subsequence = []
  for first in [0..6]    # compare every ball...
    for last in [0..6]   # ...to every other ball
      current_subsequence = this[first..last]
      unless null in current_subsequence or 0 == current_subsequence.length
        if ball in current_subsequence and @biggest_subsequence.length < current_subsequence.length
          @biggest_subsequence = this[first..last]
  @biggest_subsequence

# like in Ruby
Array::compact = ->
  item for item in this when item

# after we remove exploded balls, collapse the array, eliminating nulls where the
# exploded balls used to be (this was called drop in the earlier Ruby version)
Array::collapse = ->
  new_array = @compact()
  new_array[index] = null for index in [new_array.length..6]
  new_array

