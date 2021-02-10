require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit the Instrument New page and submit form' do
    it 'Can not create Instrument without a name' do
      dealer = create(:dealer)

      visit "/dealers/#{dealer.id}/instruments/new"
      click_button("Create Instrument")
      expect(page).to have_content("Instrument not created: Required information missing.")
    end
  end
end
