require 'spec_helper'
require_relative '../../src/basket.rb'
require_relative '../../lib/products.rb'
require_relative '../../lib/delivery_rules.rb'
require_relative '../../lib/offers.rb'

RSpec.describe Basket do
  let!(:products) { Products::LIST }
  let!(:delivery) { DeliveryRules::LIST }
  let!(:offers) { Offers::LIST }

  subject(:sub) { Basket.new(products,delivery,offers) }

  context '#add' do
    it 'should add product to basket' do
      sub.add('B01')
      expect(sub.basket.size).to eq(1)
    end

    it 'should display incorrect product when trying to add non existing product code' do
      sub.add('INVALID')
      expect(sub.basket.size).to eq(0)
    end
  end

  context '#total' do
    it 'should return the total of all product present in basket, no offers applied, total < 50' do
      sub.add('B01')
      sub.add('G01')
      total = sub.total
      expect(total).to eq(37.85)
    end
    it 'should return the total of all product present in basket, no offers applied, 50 < total < 90' do
      sub.add('R01')
      sub.add('G01')
      total = sub.total
      expect(total).to eq(60.85)
    end
    it 'should return the total of all product present in basket, no offers applied, total > 90' do
      sub.add('R01')
      sub.add('G01')
      sub.add('B01')
      sub.add('G01')
      sub.add('B01')
      sub.add('G01')
      sub.add('B01')
      total = sub.total
      expect(total).to eq(131.65)
    end
    it 'should return the total of all product present in basket, offers applied' do
      sub.add('R01')
      sub.add('R01')
      total = sub.total
      expect(total).to eq(54.37)
    end
    it 'should return the total of all product present in basket, offers applied, 50 < total < 90' do
      sub.add('R01')
      sub.add('R01')
      sub.add('R01')
      sub.add('R01')
      total = sub.total
      expect(total).to eq(98.85)
    end
    it 'should return the total of all product present in basket, offers applied, total > 90' do
      sub.add('B01')
      sub.add('B01')
      sub.add('R01')
      sub.add('R01')
      sub.add('R01')
      total = sub.total
      expect(total).to eq(98.27)
    end
    
  end
end