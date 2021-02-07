require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit "/dealers"' do
    it 'shows a link next to each dealer to be updated' do
      dealer1 = create(:dealer)
      dealer2 = create(:dealer)

      visit "/dealers"
      expect(page).to have_link("Update Dealer")
      expect(page).to have_content(dealer1.name)
      expect(page).to have_content(dealer2.name)
    end
  end

  describe 'When I click the link to update the Dealer' do
    it 'Takes me to the Dealers edit page' do
      dealer1 = create(:dealer, name: "Wow Cool Guitars")

      visit "/dealers"
      click_link("Update Dealer")
      expect(current_path).to eq("/dealers/#{dealer1.id}/edit")
    end

    it "Actually Updates the Dealer" do
      dealer1 = create(:dealer, name: "Wow Cool Guitars")
      visit "/dealers"
      click_link("Update Dealer")
      fill_in "dealer[name]", :with => "Guitar Center"
      click_button "Update Dealer"
      expect(current_path).to eq("/dealers/#{dealer1.id}")
      expect(page).to have_content("Guitar Center")
    end
  end
end
