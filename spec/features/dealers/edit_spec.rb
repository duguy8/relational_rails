require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit a Dealer show page' do
    it 'Shows a link to update the Dealer' do
      dealer1 = Dealer.create(
        id: 1,
        name: 'Guitar Center',
        fully_staffed: true,
        monthly_gross: 10000,
        city: 'Tampa',
        state: 'FL'
      )

      visit "/dealers/#{dealer1.id}"
      expect(page).to have_link('Update Dealer')
    end

    it 'When I click link to Update Dealer' do
      dealer1 = Dealer.create(
        id: 1,
        name: 'Guitar Center',
        fully_staffed: true,
        monthly_gross: 10000,
        city: 'Tampa',
        state: 'FL'
      )

      visit "/dealers/#{dealer1.id}"
      click_link "Update Dealer"
      expect(current_path).to eq("/dealers/#{dealer1.id}/edit")
    end
  end
end
