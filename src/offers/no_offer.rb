require_relative 'offers_interface.rb'

class NoOffer < OffersInterface
  def apply(qty, unit_price)
    return qty * unit_price
  end
end