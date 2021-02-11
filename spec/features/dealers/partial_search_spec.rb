require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a Dealer Index page" do
    it "Has a text box to search by keyword" do

      visit "/dealers"
      expect(page).to have_button("Search")
    end

    it "Returns me to the same page after clicking on search button" do
      visit "/dealers"
      click_button("Search")
      expect(current_path).to eq("/dealers")
    end

    it "Only shows partial match records on the page" do
      dealer1 = create(:dealer, name: "The Best Dealer")
      dealer2 = create(:dealer, name: "Huge Shop")
      dealer3 = create(:dealer, name: "best Guitars")

      visit "/dealers"
      fill_in :search, :with => "best"
      click_button("Search")
      expect(page).not_to have_content(dealer2.name)
      expect(page).to have_content(dealer1.name)
      expect(page).to have_content(dealer3.name)
    end
  end

  describe "When I visit a Instrument Index page" do
    it "Has a text box to search by keyword" do
      visit "/instruments"
      expect(page).to have_button("Search")
    end

    it "Returns me to the same page after clicking on search button" do
      visit "/instruments"
      click_button("Search")
      expect(current_path).to eq("/instruments")
    end

    it "Only shows partial match records on the page" do
      dealer = create(:dealer, id: 1)
      guitar = create(:instrument, name: "Super sweet guitar", dealer_id: 1, on_sale: true)
      bass = create(:instrument, name: "Dat bass1", dealer_id: 1, on_sale: true)
      drums = create(:instrument, name: "Sweet drumset", dealer_id: 1, on_sale: true)

      visit "/instruments"
      fill_in :search, :with => "sweet"
      click_button("Search")
      expect(page).not_to have_content(bass.name)
      expect(page).to have_content(guitar.name)
      expect(page).to have_content(drums.name)
    end

    it "Only shows partial match records on the page edge case" do
      dealer = create(:dealer, id: 1)
      guitar = create(:instrument, name: "Super sweet guitar", dealer_id: 1, on_sale: true)
      bass = create(:instrument, name: "Dat bass1", dealer_id: 1, on_sale: true)
      not_super_sweet = create(:instrument, name: "Sweet guitar", dealer_id: 1, on_sale: true)

      visit "/instruments"
      fill_in :search, :with => "Sweet guitar"
      click_button("Search")
      expect(page).not_to have_content(guitar.name)
      expect(page).not_to have_content(bass.name)
      expect(page).to have_content(not_super_sweet.name)
    end
  end
end
