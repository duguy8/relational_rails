require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I vist "/instruments/:id"' do
    it 'Should have a link to Delete Instrument' do
      guitar = create(:instrument)

      visit "/instruments/#{guitar.id}"
      expect(page).to have_link("Delete Instrument")
    end
  end
  describe "When I click the link" do
    it "Instrument is deleted and redirected to Instrument index page" do
      guitar1 = create(:instrument)
      dealer = guitar1.dealer

      visit "/instruments/#{guitar1.id}"
      expect(page).to have_link("Delete Instrument")
      click_link "Delete Instrument"
      expect(current_path).to eq("/dealers/#{dealer.id}/instruments")
      expect(page).not_to have_content(guitar1.name)
    end
  end
end
