defmodule Orders do
  @tax_rates [ NC: 0.075, TX: 0.08 ]

  @orders [
    [ id: 123, ship_to: :NC, net_amount: 100.00 ],
    [ id: 124, ship_to: :OK, net_amount: 35.50 ],
    [ id: 125, ship_to: :TX, net_amount: 24.00 ],
    [ id: 126, ship_to: :TX, net_amount: 44.80 ],
    [ id: 127, ship_to: :NC, net_amount: 25.00 ],
    [ id: 128, ship_to: :MA, net_amount: 10.00 ],
    [ id: 129, ship_to: :CA, net_amount: 102.00 ],
    [ id: 130, ship_to: :NC, net_amount: 50.00 ]
  ]

  def calc_total(orders, tax_rates) do
    for [ id: i, ship_to: s, net_amount: n ] <- orders do
      [ id: i, ship_to: s, net_amount: n, total_amount: n + n * Keyword.get(tax_rates, s, 0) ]
    end
  end

  def do_it() do
    calc_total(@orders, @tax_rates)
  end
end
