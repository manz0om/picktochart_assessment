class OffersFactory
  B1G2ATHALF = 'B1G2ATHALF'
  def initialize(offer_code)
    case(offer_code)
    when B1G2ATHALF:
      return BuyOneGetSecondHalfPriced.new
    else 
      return NoOffer.new
    end
  end
end