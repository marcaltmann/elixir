defmodule Chop do
  def guess(actual, range) do
    guess = middle(range)
    IO.puts("Is it #{guess}")
    take_guess(actual, range, guess)
  end

  defp take_guess(actual, _range, guess) when actual === guess do
    actual
  end

  defp take_guess(actual, range, guess) when actual < guess do
    new_range = (range.first)..(guess - 1)
    guess(actual, new_range)
  end

  defp take_guess(actual, range, guess) when actual > guess do
    new_range = (guess + 1)..(range.last)
    guess(actual, new_range)
  end

  defp middle(low..high), do: div(low + high, 2)
end
