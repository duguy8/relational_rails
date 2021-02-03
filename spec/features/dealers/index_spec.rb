require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit "/dealers"' do
    it 'I see every dealer' do
      dealer1 = Dealer.create(
        id: 1,
        name: 'Guitar Center'
      )
      dealer2 = Dealer.create(
        id: 2,
        name: 'Sam Ash'
      )
      dealer3 = Dealer.create(
        id: 3,
        name: 'Pianos n stuff'
      )

      visit '/dealers'
      # save_and_open_page
      expect(page).to have_content(dealer1.name)
      expect(page).to have_content(dealer2.name)
      expect(page).to have_content(dealer3.name)
    end
  end
end
