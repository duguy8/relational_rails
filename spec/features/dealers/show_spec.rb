require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit "/dealers/:id"' do
    it 'I see a dealer with its attributes' do
      dealer1 = Dealer.create(
        id: 1,
        name: 'Guitar Center',
        fully_staffed: true,
        monthly_gross: 10000,
        city: 'Tampa',
        state: 'FL'
      )

      visit "/dealers/#{dealer1.id}"

      expect(dealer1.id).to eq 1
      expect(dealer1.city).to eq 'Tampa'
      expect(page).to have_content(dealer1.name)
      expect(dealer1.fully_staffed).to be true
      expect(page).to have_content(dealer1.monthly_gross)
      expect(page).to have_content(dealer1.city)
      expect(page).to have_content(dealer1.state)
    end
  end
end
