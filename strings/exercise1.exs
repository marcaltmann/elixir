defmodule Exercise1 do
  @printable ?\s..?~

  def printable?(str), do: _printable_characters(str, true)

  defp _printable_characters([], state), do: state
  defp _printable_characters([ character | tail ], state) do
    _printable_characters(tail, state and character in @printable)
  end

  # anagram?
  def anagram?(word1, word2), do: _still_anagram?(word1, word2, true)

  defp _still_anagram?([], [], state), do: state
  defp _still_anagram?([], _, _), do: false
  defp _still_anagram?(_, [], _), do: false

  defp _still_anagram?([ head | tail ], word2, state) do
    _still_anagram?(tail, word2 -- [head], state and (head in word2))
  end

  # center
  def center(list) do
    max_length = _max_length(list)
    Enum.each(list, fn line -> IO.puts(
      String.pad_leading(
        line,
        div(max_length - String.length(line), 2) + String.length(line)
      )
    ) end)
  end

  defp _max_length(list) do
    list
      |> Enum.map(&(String.length(&1)))
      |> Enum.max()
  end

  # capitalize
  def capitalize_sentences(str) do
    str |> String.split(". ")
        |> Enum.map(fn str -> str |> String.downcase() |> String.capitalize() end)
        |> Enum.join(". ")
  end
end
