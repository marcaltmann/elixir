defmodule Orders do
  @tax_rates [ NC: 0.075, TX: 0.08 ]

  def calc_total(orders, tax_rates) do
    for [ id: i, ship_to: s, net_amount: n ] <- orders do
      [ id: i, ship_to: s, net_amount: n, total_amount: n + n * Keyword.get(tax_rates, s, 0) ]
    end
  end

  def read_file() do
    {:ok, file} = File.open("orders.csv", [:read])

    IO.read(file, :line) # Read the first line (headers)

    file
      |> IO.stream(:line)
      |> Enum.map(fn order -> order |> String.trim() |> String.split(",") end)
      |> Enum.map(fn [id, ship_to, net_amount] -> [
          id: String.to_integer(id),
          ship_to: String.to_atom(String.trim_leading(ship_to, ":")),
          net_amount: String.to_float(net_amount)
        ] end)
      |> calc_total(@tax_rates)
  end
end
