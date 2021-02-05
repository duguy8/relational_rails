require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit "/dealers"' do
    it 'Shows a link next to each dealer to be deleted' do
      dealer1 = create(:dealer)
      dealer2 = create(:dealer)

      visit "/dealers"
      expect(page).to have_link("Delete Dealer")
      expect(page).to have_content(dealer1.name)
      expect(page).to have_content(dealer2.name)
    end

    it 'Deletes Dealer when Delete Dealer is clicked' do
      dealer1 = create(:dealer, name: "Amazing Instrumentz")
      
      visit "/dealers"
      click_link("Delete Dealer")
      save_and_open_page
      expect(current_path).to eq("/dealers")
      expect(page).not_to have_content(dealer1.name)
      end
    end
  end
