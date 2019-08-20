defmodule EnumClone do
  def all?([], _func), do: true
  def all?([ head | tail ], func), do: func.(head) and all?(tail, func)

  def each([], _func), do: :ok
  def each([ head | tail ], func) do
    func.(head)
    each(tail, func)
  end

  def filter([], _func), do: []
  def filter([ head | tail ], func) do
    if func.(head) do
      [ head | filter(tail, func) ]
    else
      filter(tail, func)
    end
  end

  def take(_list, 0), do: []
  def take([], _n), do: []
  def take([ head | tail ], n), do: [ head | take(tail, n - 1) ]

  def find_rest(list, 0), do: list
  def find_rest([], _n), do: []
  def find_rest([ head | tail ], n), do: find_rest(tail, n - 1)

  def split(list, n), do: { take(list, n), find_rest(list, n) }

  # flatten(list)
  # too hard
end
