require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'Every page has link to Dealers Index' do
    it 'Should have a link at the top of the page' do
      dealer = create(:dealer, id: 1)
      guitar = create(:instrument, dealer_id: 1)
      visit "/instruments"
      expect(page).to have_link("View All Dealers")

      visit "/instruments/#{guitar.id}"
      expect(page).to have_link("View All Dealers")

      visit "/instruments/#{guitar.id}/edit"
      expect(page).to have_link("View All Dealers")

      visit "/dealers"
      expect(page).to have_link("View All Dealers")

      visit "/dealers/new"
      expect(page).to have_link("View All Dealers")

      visit "/dealers/#{dealer.id}"
      expect(page).to have_link("View All Dealers")

      visit "/dealers/#{dealer.id}/edit"
      expect(page).to have_link("View All Dealers")

      visit "/dealers/#{dealer.id}/instruments"
      expect(page).to have_link("View All Dealers")

      visit "/dealers/#{dealer.id}/instruments/new"
      expect(page).to have_link("View All Dealers")
    end

    it 'Actually takes you to Instrument Index' do
      visit "/instruments"
      click_link("View All Dealers")
      expect(current_path).to eq("/dealers")
    end
  end
end
