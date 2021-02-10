require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit the Dealer New and submit form' do
    it 'Can not create Dealer without a name' do

      visit '/dealers/new'
      click_button("Create Dealer")
      expect(page).to have_content("Dealer not created: Required information missing.")
      expect(page).to have_button('Create Dealer')
    end
  end
end
