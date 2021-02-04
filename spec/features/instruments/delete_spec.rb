require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I vist "/instruments/:id"' do
    it 'Should have a link to Delete Instrument' do
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
        on_sale: true,
        brand: "Dunable",
        dealer_id: 1,
        price: 4000
      )

      visit "/instruments/#{dealer1.id}"
      expect(page).to have_link("Delete Instrument")
    end
  end
  describe "When I click the link" do
    it "Instrument is deleted and redirected to Instrument index page" do
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
        on_sale: true,
        brand: "Dunable",
        dealer_id: 1,
        price: 4000
      )

      visit "/instruments/#{dealer1.id}"
      expect(page).to have_link("Delete Instrument")
      click_link "Delete Instrument"
      expect(current_path).to eq('/instruments')
      expect(page).not_to have_content(guitar1.name)
    end
  end
end
