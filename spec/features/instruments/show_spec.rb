require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I vist "/instruments/:id"' do
    it 'Should have the instrument with that id and its attributes' do
      guitar = create(:instrument)
      
      visit "/instruments/#{guitar.id}"
      expect(page).to have_content(guitar.name)
      expect(page).to have_content(guitar.on_sale)
      expect(page).to have_content(guitar.brand)
      expect(page).to have_content(guitar.price)
    end
  end
end
