Array::sequence = ->
  true

Array::wtf = (first, last) ->
  current_subsequence = this[first..last]
  unless null in current_subsequence or 0 == current_subsequence.length
    if ball in current_subsequence and @biggest_subsequence.length < current_subsequence.length
      @biggest_subsequence = this[first..last]

Array::subsequence = (ball) ->
  @biggest_subsequence = @wtf(first, last) for first in numbers for last in numbers

