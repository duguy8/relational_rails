require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'See a link to delete next to each Instrument' do
    it 'Has link on Instrument Index page' do
      dealer = create(:dealer, id: 1)
      guitar = create(:instrument, on_sale: true, name: "Wowza")

      visit "/instruments"
      expect(page).to have_content(guitar.name)
      expect(page).to have_link("Delete Instrument")
    end

    it 'Has link on Dealer Instrument Index' do
      dealer = create(:dealer, id: 1)
      guitar = create(:instrument, dealer_id: 1, on_sale: true, name: "Wowza")

      visit "/dealers/#{dealer.id}/instruments"
      expect(page).to have_content(guitar.name)
      expect(page).to have_link("Delete Instrument")
    end

    it 'Deletes Instrument and taken back to Instrument Index from Instrument Index' do
      dealer = create(:dealer, id: 1)
      guitar = dealer.instruments.create!({
        id: 1,
        name: "Sweet",
        brand: "Dunable",
        dealer_id: 1,
        on_sale: true,
        price: 1000,
        created_at: "10-10-2020",
        updated_at: "10-11-2020",
        })

      visit "/instruments"
      click_link("Delete Instrument")
      expect(current_path).to eq("/dealers/#{dealer.id}/instruments")
      expect(page).not_to have_content(guitar.name)
    end

    it 'Deletes Instrument and taken back to Instrument Index from Dealers Instrument Index' do
      dealer = create(:dealer, id: 1)
      guitar = dealer.instruments.create!({
        id: 1,
        name: "Sweet",
        brand: "Dunable",
        dealer_id: 1,
        on_sale: true,
        price: 1000,
        created_at: "10-10-2020",
        updated_at: "10-11-2020",
        })

      visit "/dealers/#{dealer.id}/instruments"
      click_link("Delete Instrument")
      expect(current_path).to eq("/dealers/#{dealer.id}/instruments")
      expect(page).not_to have_content(guitar.name)
    end
  end
end
