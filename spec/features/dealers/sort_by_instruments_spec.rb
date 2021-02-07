require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I see the Dealers Index Page' do
    it 'Has a link to sort parents by number of instruments' do

      visit "/dealers"
      expect(page).to have_link("See Dealers by Number of Instruments in Stock")
    end

    it 'Takes me back to the Dealer Index' do
      visit "/dealers"
      click_link("See Dealers by Number of Instruments in Stock")
      expect(current_path).to eq("/dealers")
    end

    it 'Shows Dealers from most instruments to least with number next to each dealer' do
      dealer1 = create(:dealer, id: 1)
      dealer2 = create(:dealer, id: 2)
      dealer3 = create(:dealer, id: 3)
      guitars = create_list(:instrument, 6, dealer_id: 1, on_sale: true)
      drumsets = create_list(:instrument, 4, dealer_id: 2, on_sale: true)
      basses = create_list(:instrument, 9, dealer_id: 3, on_sale: true)

      visit "/dealers"
      click_link("See Dealers by Number of Instruments in Stock")
      expect(dealer3.name).to appear_before(dealer1.name)
      expect(dealer1.name).to appear_before(dealer2.name)
      expect(dealer3.name).to appear_before(dealer2.name)
    end
  end
end
