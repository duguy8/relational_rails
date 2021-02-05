require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit a Dealer show page' do
    it 'Shows a link to update the Dealer' do
      dealer1 = create(:dealer)

      visit "/dealers/#{dealer1.id}"
      expect(page).to have_link('Update Dealer')
    end

    it 'When I click link to Update Dealer' do
      dealer1 = create(:dealer)

      visit "/dealers/#{dealer1.id}"
      click_link "Update Dealer"
      expect(current_path).to eq("/dealers/#{dealer1.id}/edit")
    end

    it 'When I fill out the form and submit the Dealer is updated' do
      dealer1 = create(:dealer)

      visit "/dealers/#{dealer1.id}"
      expect(page).to have_link("Update Dealer")
      click_link "Update Dealer"
      expect(current_path).to eq("/dealers/#{dealer1.id}/edit")

      fill_in "dealer[name]", :with => 'Sam Ash'
      click_button 'Update Dealer'
      expect(current_path).to eq("/dealers/#{dealer1.id}")
      expect(page).to have_content("Sam Ash")
    end
  end
end
