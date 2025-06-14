class BuyOneGetSecondHalfPriced < OffersInterface
  def apply(qty,unit_price)
    half_one = (qty/2).to_i
    half_two = qty - half_two
    return (half_two * unit_price) + (half_one * (unit_price/2))
  end
end