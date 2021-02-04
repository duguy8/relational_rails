require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I vist "/instruments/:id"' do
    it 'Should have the instrument with that id and its attributes' do
      dealer1 = Dealer.create(
          id: 1,
          name: 'Guitar Center',
          fully_staffed: true,
          monthly_gross: 10000,
          city: 'Tampa',
          state: 'FL'
        )
      guitar1 = Instrument.create(
        id: 1,
        name: "Cyclops",
        on_sale: false,
        brand: "Dunable",
        dealer_id: 1,
        price: 4000
      )

      visit "/instruments/#{dealer1.id}"
      save_and_open_page
      expect(page).to have_content(guitar1.name)
      expect(page).to have_content(guitar1.on_sale)
      expect(page).to have_content(guitar1.brand)
      expect(page).to have_content(guitar1.price)
    end
  end
end
