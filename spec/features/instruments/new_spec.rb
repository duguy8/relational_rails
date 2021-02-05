require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a Dealer's Instrument Index page" do
    it "Has a link to add a new adoptable child for that Dealer Create Instrument" do
      dealer1 = Dealer.create(
          id: 1,
          name: 'Guitar Center',
          fully_staffed: true,
          monthly_gross: 10000,
          city: 'Tampa',
          state: 'FL'
        )
      guitar = Instrument.create(
        id: 1,
        name: "Cyclops",
        on_sale: true,
        brand: "Dunable",
        dealer_id: 1,
        price: 4000
      )

      drums = Instrument.create(
        id: 2,
        name: "Electronic",
        on_sale: false,
        brand: "Roland",
        dealer_id: 1,
        price: 2500
      )

      bass = Instrument.create(
        id: 3,
        name: "EC3000",
        on_sale: true,
        brand: "ESP",
        dealer_id: 1,
        price: 2000
      )

      visit "/dealers/#{dealer1.id}/instruments"

      expect(current_path).to eq("/dealers/#{dealer1.id}/instruments")
      expect(page).to have_link('Create Instrument')
    end

    it 'Takes us ".../instruments/new" Where there is a form for a new instrument' do
      dealer1 = Dealer.create(
          id: 1,
          name: 'Guitar Center',
          fully_staffed: true,
          monthly_gross: 10000,
          city: 'Tampa',
          state: 'FL'
        )
      guitar = Instrument.create(
        id: 1,
        name: "Cyclops",
        on_sale: true,
        brand: "Dunable",
        dealer_id: 1,
        price: 4000
      )

      drums = Instrument.create(
        id: 2,
        name: "Electronic",
        on_sale: false,
        brand: "Roland",
        dealer_id: 1,
        price: 2500
      )

      bass = Instrument.create(
        id: 3,
        name: "EC3000",
        on_sale: true,
        brand: "ESP",
        dealer_id: 1,
        price: 2000
      )

      visit "/dealers/#{dealer1.id}/instruments"
      click_link 'Create Instrument'
      expect(current_path).to eq("/dealers/#{dealer1.id}/instruments/new")
      expect(page).to have_button('Create Instrument')
    end
  end
  describe 'A post request is sent, a new instrument is created for the dealer' do
    it 'Takes us to the Dealers Instrument Page with the new one listed' do
      dealer1 = Dealer.create(
          id: 1,
          name: 'Guitar Center',
          fully_staffed: true,
          monthly_gross: 10000,
          city: 'Tampa',
          state: 'FL'
        )

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
