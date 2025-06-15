require_relative 'offers/offers_factory.rb'

class Basket
  attr_accessor :basket
  def initialize(product_catalog,delivery_rules,offers)
    @product_catalog = product_catalog
    @delivery_rules = delivery_rules
    @offers = offers
    @basket = {}
  end

  def add(product_code)
    if @product_catalog[product_code]
      basket[product_code] = @basket[product_code].nil? ? 1 : basket[product_code]+1
      puts "Product #{product_code} added"
    else
      puts "This #{product_code} product do not exists, kindly add correct product code"
    end
  end

  def total
    net_amount = 0.0
    basket.each do |product_code, qty|
      unit_price = @product_catalog[product_code][:price]
      offer_code = @product_catalog[product_code][:offer_code]
      offer = OffersFactory.get_offer(offer_code)
      amount_with_offer = offer.apply(qty.to_i, unit_price.to_f)
      net_amount += amount_with_offer
    end
    delivery_charges = calculate_charges(net_amount)
    gross_total = net_amount + delivery_charges
    return gross_total.truncate(2)
  end

  def calculate_charges(amount)
    charge_list = @delivery_rules.sort_by{|i| i.min}
    charge_list.each do |row|
      if row[:min] <= amount && amount <= row[:max]
        return row[:charge]
      end
    end
    return 0
  end
end