require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit a Dealer Show page' do
    it 'Should have a link to Dealers Instruments Page' do
      dealer = create(:dealer, id: 1, name: "Sweet Store")
      guitar = create(:instrument, dealer_id: 1)

      visit "/dealers/#{dealer.id}"
      expect(page).to have_link("#{dealer.name} All Instruments in Stock")
      click_link("#{dealer.name} All Instruments in Stock")
      expect(current_path).to eq("/dealers/#{dealer.id}/instruments")
      expect(page).to have_content(guitar.name)
    end
  end
end
