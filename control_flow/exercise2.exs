defmodule Exercise2 do
  def ok!({:ok, data}), do: data
  def ok!({:error, type}), do: raise RuntimeError, message: Atom.to_string(type)
end
