defmodule MyList do
  def len([]), do: 0
  def len([_head|tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([ head | tail ]), do: [ head*head | square(tail) ]

  def map([], _func), do: []
  def map([ head | tail ], func), do: [ func.(head) | map(tail, func) ]

  def sum([]), do: 0
  def sum([ head | tail ]), do: head + sum(tail)

  def mapsum([], _func), do: 0
  def mapsum([ head | tail ], func), do: func.(head) + mapsum(tail, func)

  def span(a, a), do: [ a ]
  def span(a, b), do: [ a | span(a + 1, b)  ]

  def prime_numbers(n) do
    for x <- 1..n, (for y <- 1..x, rem(x, y) === 0, do: y) === [1, x], do: x
  end

  def max2(list, value \\ nil)
  def max2([], value), do: value
  def max2([ head | tail ], nil), do: max2(tail, head)
  def max2([ head | tail ], value) when head > value, do: max2(tail, head)
  def max2([ head | tail ], value) when head <= value, do: max2(tail, value)

  def caesar([], _n), do: []
  def caesar([ head | tail ], n) when head + n > 122, do: [ head + n - 26 | caesar(tail, n) ]
  def caesar([ head | tail ], n), do: [ head + n | caesar(tail, n) ]
end
