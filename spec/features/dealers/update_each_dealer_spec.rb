require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit "/dealers"' do
    it 'shows a link next to each dealer to be updated' do
      dealer1 = create(:dealer)
      dealer2 = create(:dealer)

      visit "/dealers"
      expect(page).to have_link("Update Dealer")
    end
  end

  describe 'When I click the link to update the Dealer' do
    it 'Takes me to the Dealers edit page and updates the Dealer' do
    end
  end
end

# When I click the link
# I should be taken to that parents edit page where
# I can update its information just like in User Story 4
