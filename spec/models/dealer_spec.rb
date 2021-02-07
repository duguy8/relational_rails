require 'rails_helper'

RSpec.describe Dealer, type: :model do
  describe 'validations' do
      it {should validate_presence_of :name}
    end

    describe 'relationships' do
      it {should have_many :instruments}
    end

    describe 'class methods' do
      it 'Orders dealers by recently created first' do
        dealer1 = create(:dealer, created_at: "08-01-1983")
        dealer2 = create(:dealer, created_at: "11-01-1990")
        dealer3 = create(:dealer, created_at: "01-01-2020")

        dealers = Dealer.all
        expected = [dealer3, dealer2, dealer1]
        expect(dealers.order_by).to eq(expected)
      end

      it 'Search finds a dealer by name' do
        dealer1 = create(:dealer, name: "A Store")
        dealer2 = create(:dealer, name: "B Store")
        dealer3 = create(:dealer, name: "Super Center")

        dealers = Dealer.all
        expected = [dealer1]
        bad1 = [dealer2]
        bad2 = [dealer3]
        expect(dealers.search("A Store")).to eq(expected)
        expect(dealers.search("A Store")).to_not eq(bad1)
        expect(dealers.search("A Store")).to_not eq(bad2)
      end

      it 'Sorts by number of instruments' do
        dealer1 = create(:dealer, id: 1)
        dealer2 = create(:dealer, id: 2)
        dealer3 = create(:dealer, id: 3)
        guitars = create_list(:instrument, 6, dealer_id: 1, on_sale: true)
        drumsets = create_list(:instrument, 4, dealer_id: 2, on_sale: true)
        basses = create_list(:instrument, 9, dealer_id: 3, on_sale: true)

        expected = [dealer3, dealer1, dealer2]
        expect(Dealer.sort_by_instruments).to eq(expected)
      end

      it 'Search finds a dealer by partial name' do
        dealer1 = create(:dealer, name: "A Store")
        dealer2 = create(:dealer, name: "B Store")
        dealer3 = create(:dealer, name: "Super Center b")

        dealers = Dealer.all
        expected = [dealer2, dealer3]
        bad = [dealer1]
        expect(dealers.partial_search("b")).to eq(expected)
        expect(dealers.partial_search("b")).to_not eq(bad)
      end
    end
end
