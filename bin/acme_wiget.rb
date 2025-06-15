require_relative '../src/basket.rb'
require_relative '../lib/products.rb'
require_relative '../lib/delivery_rules.rb'
require_relative '../lib/offers.rb'

def print_info
  puts "============================"
  puts "Enter 1 to Add Product"
  puts "Enter 2 to Display Total"
  puts "Enter x to Exit "
  puts "----------------------------"
end

begin
  print_info
  input = gets.chomp
  basket = Basket.new(Products::LIST, DeliveryRules::LIST, Offers::LIST)

  while input.downcase != 'x'
    case input
    when '1'
      puts "Enter Product Code to add to basket"
      product_code = gets.chomp
      basket.add(product_code)
    when '2'
      total = basket.total
      puts "!!! Total value of the basket = #{total} "
      puts "----------------------------"
    else
      puts "Invalid input"
    end
    print_info
    input = gets.chomp
  end
rescue => e
  puts e.message
end