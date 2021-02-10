require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit the Dealers Instrument Index Page' do
    it 'Shows a link to sort instruments in alphabetical order' do
      dealer = create(:dealer, id: 1)

      visit "/dealers/#{dealer.id}/instruments"
      expect(page).to have_link("Sort Instruments by Name")
    end
  end

  describe 'After clicking link Im taken to Dealers Instrument index page' do
    it 'Shows all Instruments in Alphabetical Order' do
      dealer = create(:dealer, id: 1)
      mic = create(:instrument, name: 'Mic', dealer_id: 1)
      bass = create(:instrument, name: 'Bass', dealer_id: 1)
      shaker = create(:instrument, name: 'Shaker', dealer_id: 1)

      visit "/dealers/#{dealer.id}/instruments"
      click_link("Sort Instruments by Name")
      expect(bass.name).to appear_before(mic.name)
      expect(mic.name).to appear_before(shaker.name)
      expect(bass.name).to appear_before(shaker.name)
    end
  end
end
