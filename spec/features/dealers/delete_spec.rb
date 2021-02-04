require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit a Dealer show page' do
    it 'Should have a link to delete the Dealer' do
      dealer1 = Dealer.create(
        id: 1,
        name: 'Guitar Center',
        fully_staffed: true,
        monthly_gross: 10000,
        city: 'Tampa',
        state: 'FL'
      )

      visit "/dealers/#{dealer1.id}"
      expect(page).to have_link("Delete Dealer")
    end

    it 'Gets deleted when clicking the link Delete Dealer' do
      dealer1 = Dealer.create(
        id: 1,
        name: 'Guitar Center',
        fully_staffed: true,
        monthly_gross: 10000,
        city: 'Tampa',
        state: 'FL'
      )

      visit "/dealers/#{dealer1.id}"
      click_link "Delete Dealer"
      expect(page).not_to have_content(dealer1.name)
      expect(current_path).to eq('/dealers')
    end
  end
end
