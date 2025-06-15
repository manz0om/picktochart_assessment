require_relative 'offers_interface.rb'

class BuyOneGetSecondHalfPriced < OffersInterface
  def apply(qty,unit_price)
    half_one = (qty/2).to_i
    half_two = qty - half_one
    return (half_two * unit_price) + (half_one * (unit_price/2))
  end
end