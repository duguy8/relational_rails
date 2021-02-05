require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit "/dealers/:id"' do
    it 'I see a dealer with its attributes' do
      dealer1 = Dealer.create(
        id: 1,
        name: 'Guitar Center',
        fully_staffed: true,
        sq_ft: 8000,
        city: 'Tampa',
        state: 'FL'
      )

      visit "/dealers/#{dealer1.id}"

      expect(dealer1.id).to eq 1
      expect(dealer1.city).to eq 'Tampa'
      expect(page).to have_content(dealer1.name)
      expect(dealer1.fully_staffed).to be true
      expect(page).to have_content(dealer1.sq_ft)
      expect(page).to have_content(dealer1.city)
      expect(page).to have_content(dealer1.state)
    end

    it 'Shows a count of the number of instruments for this dealer' do
      dealer = create(:dealer, id: 1)
      guitar = create(:instrument, dealer_id: 1)
      drums = create(:instrument, dealer_id: 1)
      bass = create(:instrument, dealer_id: 1)
      microphone = create(:instrument, dealer_id: 1)

      visit "/dealers/#{dealer.id}"
      expect(page).to have_content("4 Instruments in Stock!")
    end
  end
end
