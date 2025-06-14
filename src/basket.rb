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
    
  end
end