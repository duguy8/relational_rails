require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit the Dealer index or a Dealers Instrument index" do
    it "Each Instrument has a link to be updated" do
      dealer = create(:dealer, id: 1)
      guitar = create(:instrument, dealer_id: 1, on_sale: true)
      drums = create(:instrument, dealer_id: 1, on_sale: true)
      bass = create(:instrument, dealer_id: 1, on_sale: true)

      visit "/instruments"
      expect(page).to have_content(guitar.name)
      expect(page).to have_content(drums.name)
      expect(page).to have_content(bass.name)
      expect(page).to have_link("Update Instrument")

      visit "/dealers/#{dealer.id}/instruments"
      expect(page).to have_content(guitar.name)
      expect(page).to have_content(drums.name)
      expect(page).to have_content(bass.name)
      expect(page).to have_link("Update Instrument")
    end
  end

  describe "Should take me to the Instrument Edit page, and update it" do
    it "Should update from the Instrument Index" do
      dealer = create(:dealer, id: 1)
      guitar = create(:instrument, dealer_id: 1, on_sale: true, name: "Wowza")

      visit "/instruments"
      click_link("Update Instrument")
      expect(current_path).to eq("/instruments/#{guitar.id}/edit")
      expect(page).to have_button("Update Instrument")
      fill_in "instrument[name]", :with => "Electrical Guitar Company"
      click_button "Update Instrument"
      expect(current_path).to eq("/instruments/#{guitar.id}")
      expect(page).to have_content("Electrical Guitar Company")
    end

    it "Should also update from the Dealers Instrument Index" do
      dealer = create(:dealer, id: 1)
      guitar = create(:instrument, dealer_id: 1, on_sale: true, name: "Wowza")

      visit "/dealers/#{dealer.id}/instruments"
      click_link("Update Instrument")
      expect(current_path).to eq("/instruments/#{guitar.id}/edit")
      expect(page).to have_button("Update Instrument")
      fill_in "instrument[name]", :with => "Electrical Guitar Company"
      click_button "Update Instrument"
      expect(current_path).to eq("/instruments/#{guitar.id}")
      expect(page).to have_content("Electrical Guitar Company")
    end
  end
end
