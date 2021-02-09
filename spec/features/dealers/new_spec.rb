require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit the Dealer Index page' do
    it 'link takes us to "/dealers/new"' do

      visit '/dealers'
      click_link "Create Dealer"
      fill_in 'name', :with => 'Sweet Shop'
      expect(current_path).to eq("/dealers/new")
      save_and_open_page
      click_button "Create Dealer"
      expect(Dealer.all.count).to eq 1
      expect(page).to have_content(Dealer)
    end
  end
end
