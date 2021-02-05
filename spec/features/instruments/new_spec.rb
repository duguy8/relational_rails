require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a Dealer's Instrument Index page" do
    it "Has a link to add a new adoptable child for that Dealer Create Instrument" do
        dealer1 = create(:dealer)

      visit "/dealers/#{dealer1.id}/instruments"

      expect(current_path).to eq("/dealers/#{dealer1.id}/instruments")
      expect(page). to have_link('Create Instrument')
    end

    it 'Takes us ".../instruments/new" Where there is a form for a new instrument' do
      dealer1 = create(:dealer)

      visit "/dealers/#{dealer1.id}/instruments"
      click_link 'Create Instrument'
      expect(current_path).to eq("/dealers/#{dealer1.id}/instruments/new")
      expect(page).to have_button('Create Instrument')
    end
  end
  
  describe 'A post request is sent, a new instrument is created for the dealer' do
    it 'Takes us to the Dealers Instrument Page with the new one listed' do
      dealer1 = create(:dealer)

      visit "/dealers/#{dealer1.id}/instruments"
      click_link 'Create Instrument'
      fill_in "instrument[name]", :with => "Sweet New Instrument"
      fill_in "instrument[brand]", :with => "Wow"
      click_button 'Create Instrument'

      expect(current_path).to eq("/dealers/#{dealer1.id}/instruments")
      expect(page).to have_content("Sweet New Instrument")
      expect(page).to have_content("Wow")
    end
  end
end
