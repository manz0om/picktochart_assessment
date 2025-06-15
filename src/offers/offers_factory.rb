require_relative 'no_offer.rb'
require_relative 'buy_one_get_second_half_priced.rb'

class OffersFactory
  B1G2ATHALF = 'B1G2ATHALF'
  def self.get_offer(offer_code)
    case(offer_code)
    when B1G2ATHALF
      return BuyOneGetSecondHalfPriced.new
    else 
      return NoOffer.new
    end
  end
end