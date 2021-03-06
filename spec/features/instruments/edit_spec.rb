require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit "/instruments/:id"' do
    it 'I see a link to update the Instrument titled Update Instrument' do
      guitar1 = create(:instrument)

      visit "/instruments/#{guitar1.id}"
      expect(page).to have_link("Update Instrument")
    end
  end

  describe "After clicking the link" do
    it "Takes us to '/instruments/:id/edit' where theres a form to edit" do
      guitar1 = create(:instrument)

      visit "/instruments/#{guitar1.id}"
      click_link "Update Instrument"
      expect(current_path).to eq("/instruments/#{guitar1.id}/edit")
    end
  end

  describe "On Instruments Edit page there is a form and when submitting" do
    it "Sends patch request to '/instruments/:id', redirected to instrument show page" do
      guitar1 = create(:instrument)

      visit "/instruments/#{guitar1.id}"
      click_link "Update Instrument"
      expect(current_path).to eq("/instruments/#{guitar1.id}/edit")
      expect(page).to have_button("Update Instrument")
      fill_in "name", :with => "PRS"
      click_button "Update Instrument"
      expect(current_path).to eq("/instruments/#{guitar1.id}")
      expect(page).to have_content("PRS")
    end
  end
end
