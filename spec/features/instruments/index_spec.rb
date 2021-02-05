require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I vist "/instruments"' do
    it 'Should list every instrument and its attributes' do
      guitar1 = create(:instrument)
      guitar2 = create(:instrument)

      visit '/instruments'
      expect(page).to have_content(guitar1.name)
      expect(page).to have_content(guitar1.on_sale)
      expect(page).to have_content(guitar1.brand)
      expect(page).to have_content(guitar1.price)
      expect(page).to have_content(guitar2.name)
      expect(page).to have_content(guitar2.on_sale)
      expect(page).to have_content(guitar2.brand)
      expect(page).to have_content(guitar2.price)
    end
  end
  describe 'When I visit "/dealers/:dealer.id/instruments"' do
    it 'Shows each instrument that is associated with its dealer' do
      guitar = create(:instrument)
      dealer1 = guitar.dealer

      visit "/dealers/#{dealer1.id}/instruments"
      expect(page).to have_content(guitar.name)
      expect(page).to have_content(guitar.on_sale)
      expect(page).to have_content(guitar.brand)
      expect(page).to have_content(guitar.price)
    end
  end
end
