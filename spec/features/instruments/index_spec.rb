require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I vist "/instruments"' do
    it 'Should list every instrument and its attributes' do
      guitar1 = create(:instrument, on_sale: true)
      guitar2 = create(:instrument, on_sale: true)

      visit '/instruments'
      expect(page).to have_content(guitar1.name)
      expect(page).to have_content(guitar1.brand)
      expect(page).to have_content(guitar1.price)
      expect(page).to have_content(guitar2.name)
      expect(page).to have_content(guitar2.brand)
      expect(page).to have_content(guitar2.price)
    end

    it 'Should only display instruments that are on sale' do
      guitar = create(:instrument, on_sale: true)
      drumset = create(:instrument, on_sale: false)
      bass = create(:instrument, on_sale: true)
      microphone = create(:instrument, on_sale: false)
      visit '/instruments'
      expect(page).to have_content(guitar.name)
      expect(page).to have_content(bass.name)
      expect(page).not_to have_content(drumset.name)
      expect(page).not_to have_content(microphone.name)
    end
  end

  describe 'When I visit "/dealers/:dealer.id/instruments"' do
    it 'Shows each instrument that is associated with its dealer' do
      guitar = create(:instrument, on_sale: true)
      dealer1 = guitar.dealer

      visit "/dealers/#{dealer1.id}/instruments"
      expect(page).to have_content(guitar.on_sale)
      expect(page).to have_content(guitar.brand)
      expect(page).to have_content(guitar.price)
    end
  end
  describe 'As a visitor on the Instrument Index page'do
    it 'Has a form with an input number value' do
      guitar = create(:instrument, on_sale: true)
      dealer1 = guitar.dealer

      visit "/dealers/#{dealer1.id}/instruments"
      expect(page).to have_content(guitar.name)
      expect(page).to have_button("Find Instruments")
    end
    it 'Returns Instruments greater than $100 back on the current instrument page' do
      dealer1 = create(:dealer, id: 1)
      guitar = create(:instrument, price: 1000, dealer_id: 1)
      guitar2 = create(:instrument, price: 50, dealer_id: 1)
      guitar3 = create(:instrument, price: 3000, dealer_id: 1)

      visit "/dealers/#{dealer1.id}/instruments"
      fill_in ("Filter by Price - Greater Than:"), :with => "100"
      click_button("Find Instruments")
      expect(current_path).to eq("/dealers/#{dealer1.id}/instruments")
      expect(page).to have_content(guitar.name)
      expect(page).to have_content(guitar3.name)
      expect(page).not_to have_content(guitar2.name)
    end
  end
end
