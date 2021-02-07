require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'Every page has link to Instrument Index' do
    it 'Should have a link at the top of the page' do
      dealer = create(:dealer, id: 1)
      guitar = create(:instrument, dealer_id: 1)
      visit "/instruments"
      expect(page).to have_link("View All Instruments")

      visit "/instruments/#{guitar.id}"
      expect(page).to have_link("View All Instruments")

      visit "/instruments/#{guitar.id}/edit"
      expect(page).to have_link("View All Instruments")

      visit "/dealers"
      expect(page).to have_link("View All Instruments")

      visit "/dealers/new"
      expect(page).to have_link("View All Instruments")

      visit "/dealers/#{dealer.id}"
      expect(page).to have_link("View All Instruments")

      visit "/dealers/#{dealer.id}/edit"
      expect(page).to have_link("View All Instruments")

      visit "/dealers/#{dealer.id}/instruments"
      expect(page).to have_link("View All Instruments")

      visit "/dealers/#{dealer.id}/instruments/new"
      expect(page).to have_link("View All Instruments")
    end

    it 'Actually takes you to Instrument Index' do
      visit "/dealers"
      click_link("View All Instruments")
      expect(current_path).to eq("/instruments")
    end
  end
end
