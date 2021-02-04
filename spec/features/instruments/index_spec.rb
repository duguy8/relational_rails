require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I vist "/instruments"' do
    it 'Should list every instrument and its attributes' do
      dealer1 = Dealer.create(
          id: 1,
          name: 'Guitar Center',
          fully_staffed: true,
          monthly_gross: 10000,
          city: 'Tampa',
          state: 'FL'
        )
      guitar1 = Instrument.create(
        name: "Cyclops",
        on_sale: false,
        brand: "Dunable",
        dealer_id: 1,
        price: 4000
      )
      visit '/instruments'
      expect(page).to have_content(guitar1.name)
      expect(page).to have_content(guitar1.on_sale)
      expect(page).to have_content(guitar1.brand)
      expect(page).to have_content(guitar1.price)
    end
  end
  describe 'When I visit "/dealers/:dealer.id/instruments"' do
    it 'Shows each instrument that is associated with its dealer' do
      dealer1 = Dealer.create(
        id: 1,
        name: 'Guitar Center',
        fully_staffed: true,
        monthly_gross: 10000,
        city: 'Tampa',
        state: 'FL'
      )

      guitar = Instrument.create(
        name: "Cyclops",
        on_sale: false,
        brand: "Dunable",
        dealer_id: 1,
        price: 4000
      )

      visit "/dealers/#{dealer1.id}/instruments"
      save_and_open_page
      expect(page).to have_content(guitar.name)
      expect(page).to have_content(guitar.on_sale)
      expect(page).to have_content(guitar.brand)
      expect(page).to have_content(guitar.price)
    end
  end
end
