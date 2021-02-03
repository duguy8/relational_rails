require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit the Dealer Index page' do
    it 'link takes us to "/dealers/new"' do
      dealer1 = Dealer.create(
        id: 1,
        name: 'Guitar Center',
        fully_staffed: true,
        monthly_gross: 10000,
        city: 'Tampa',
        state: 'FL'
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

      click_link "Create Dealer"
      expect(current_path).to eq("/dealers/new")
    end
  end
end
