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
      expect(page).to have_content(guitar.name)
      expect(page).to have_content(guitar.on_sale)
      expect(page).to have_content(guitar.brand)
      expect(page).to have_content(guitar.price)
    end
  end
end
