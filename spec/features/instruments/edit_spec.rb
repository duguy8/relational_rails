require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit "/instruments/:id"' do
    it 'I see a link to update the Instrument titled Update Instrument' do
      dealer1 = Dealer.create(
        id: 1,
        name: 'Guitar Center',
        fully_staffed: true,
        monthly_gross: 10000,
        city: 'Tampa',
        state: 'FL'
      )
      guitar1 = Instrument.create(
        id: 1,
        name: "Cyclops",
        on_sale: true,
        brand: "Dunable",
        dealer_id: 1,
        price: 4000
      )

      visit "/instruments/#{guitar1.id}"
      expect(page).to have_link("Update Instrument")
    end
  end
  describe "After clicking the link" do
    it "Takes us to '/instruments/:id/edit' where theres a form to edit" do
      dealer1 = Dealer.create(
        id: 1,
        name: 'Guitar Center',
        fully_staffed: true,
        monthly_gross: 10000,
        city: 'Tampa',
        state: 'FL'
      )
      guitar1 = Instrument.create(
        id: 1,
        name: "Cyclops",
        on_sale: true,
        brand: "Dunable",
        dealer_id: 1,
        price: 4000
      )

      visit "/instruments/#{guitar1.id}"
      click_link "Update Instrument"
      expect(current_path).to eq("/instruments/#{guitar1.id}/edit")
    end
  end
  describe "On Instruments Edit page there is a form and when submitting" do
    it "Sends patch request to '/instruments/:id', redirected to instrument show page" do
      dealer1 = Dealer.create(
        id: 1,
        name: 'Guitar Center',
        fully_staffed: true,
        monthly_gross: 10000,
        city: 'Tampa',
        state: 'FL'
      )
      guitar1 = Instrument.create(
        id: 1,
        name: "Cyclops",
        on_sale: true,
        brand: "Dunable",
        dealer_id: 1,
        price: 4000
      )

      visit "/instruments/#{guitar1.id}"
      click_link "Update Instrument"
      expect(current_path).to eq("/instruments/#{guitar1.id}/edit")
      expect(page).to have_button("Update Instrument")

      fill_in "instrument[name]", :with => "PRS"
      click_button "Update Instrument"
      expect(current_path).to eq("/instruments/#{guitar1.id}")
      expect(page).to have_content("PRS")
    end
  end
end
