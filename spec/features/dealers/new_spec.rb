require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit the Dealer Index page' do
    it 'link takes us to "/dealers/new"' do

      visit '/dealers'
      click_link "Create Dealer"
      expect(current_path).to eq("/dealers/new")
      fill_in 'dealer[name]', :with => 'New Dealer'
      click_button 'Create Dealer'
      expect(Dealer.all.count).to eq 1
      expect(page).to have_content(Dealer)
    end
  end
end
