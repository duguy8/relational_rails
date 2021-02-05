require 'rails_helper'

RSpec.describe Instrument, type: :model do
  describe 'validations' do
      it {should validate_presence_of :brand}
    end

    describe 'relationships' do
      it {should belong_to :dealer}
    end

    describe 'class methods' do
      it 'Finds all instruments on sale' do
        dealer = create(:dealer, id: 1)
        guitar1 = create(:instrument, dealer_id: 1, on_sale: true)
        guitar2 = create(:instrument, dealer_id: 1, on_sale: false)
        guitar3 = create(:instrument, dealer_id: 1, on_sale: true)

        expected = dealer.instruments.all_on_sale
        expect(expected.count).to eq 2
        expect(expected[0].on_sale).to eq(true)
        expect(expected[1].on_sale).to eq(true)
      end

      it 'Filters price to be greater than given amount' do
        dealer = create(:dealer, id: 1)
        guitar1 = create(:instrument, dealer_id: 1, price: 10000)
        guitar2 = create(:instrument, dealer_id: 1, price: 500)
        guitar3 = create(:instrument, dealer_id: 1, price: 7500)
        guitar4 = create(:instrument, dealer_id: 1, price: 100)

        expected = dealer.instruments.filter_price(200)
        expect(expected.count).to eq 3
        expect(expected[0].price).to eq(10000)
        expect(expected[1].price).to eq(500)
        expect(expected[2].price).to eq(7500)
      end
    end
end
