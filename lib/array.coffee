# this code is all about monkey-patching. a brief defense thereof: monkey-patching is very risky
# in swappable, modular application components such as gems and Rails plugins. a game operates
# differently. gems and plugins must collaborate cleanly with all sorts of unknown code. a game
# declares its own world and rules it completely. I enjoy monkey-patching even within gems and
# plugins, but guilt tinges that enjoyment, while caution restrains it. here, in a game, I feel
# free to monkey-patch all I want.

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

# like in Ruby
Array::flatten = ->
  # straight nabbed from http://bit.ly/oVOjXP
  [].concat.apply([], this)

# after we remove exploded balls, collapse the array, eliminating nulls where the
# exploded balls used to be (this was called drop in the earlier Ruby version)
Array::collapse = ->
  new_array = @compact()
  new_array[index] = null for index in [new_array.length..6]
  new_array

