require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a Dealer Index page" do
    it "Has a text box to filter results by a keyword" do

      visit "/dealers"
      expect(page).to have_button("Search")
    end

    it "Shows one record returned on the same page after pressing search button" do
      dealer1 = create(:dealer, name: "The Main Stop Shop")
      dealer2 = create(:dealer, name: "Amazingly Small Store")
      dealer3 = create(:dealer, name: "Underwater Emporium")

      visit "/dealers"
      fill_in :search, :with => "Underwater Emporium"
      click_button("Search")
      expect(current_path).to eq("/dealers")
      expect(page).to have_content(dealer3.name)
      expect(page).not_to have_content(dealer1.name)
      expect(page).not_to have_content(dealer2.name)
    end

    it "Shows more records returned on the same page after pressing search button" do
      dealer1 = create(:dealer, name: "The Main Stop Shop")
      dealer2 = create(:dealer, name: "Amazingly Small Store")
      dealer3 = create(:dealer, name: "Underwater Emporium")
      dealer4 = create(:dealer, name: "Amazingly Small Store")

      visit "/dealers"
      fill_in :search, :with => "Amazingly Small Store"
      click_button("Search")
      expect(current_path).to eq("/dealers")
      expect(page).to have_content(dealer2.name)
      expect(page).to have_content(dealer4.name)
      expect(page).not_to have_content(dealer1.name)
      expect(page).not_to have_content(dealer3.name)
    end
  end

  describe "When I visit an Instruments Index page" do
    it "Has a text box to filter results by a keyword" do
      visit "/instruments"
      expect(page).to have_button("Search")
    end

    it "Shows one record returned on the same page after pressing search button" do
      dealer = create(:dealer, name: "What Nice Guitars Inc", id: 1)
      guitar1 = create(:instrument, name: "Dunable", dealer_id: 1, on_sale: true)
      guitar2 = create(:instrument, name: "PRS", dealer_id: 1, on_sale: true)
      guitar3 = create(:instrument, name: "ESP", dealer_id: 1, on_sale: true)

      visit "/instruments"
      fill_in :search, :with => "Dunable"
      click_button("Search")
      expect(current_path).to eq("/instruments")
      expect(page).to have_content(guitar1.name)
      expect(page).not_to have_content(guitar2.name)
      expect(page).not_to have_content(guitar3.name)
    end

    it "Shows more records returned on the same page after pressing search button" do
      dealer = create(:dealer, name: "What Nice Guitars Inc", id: 1)
      guitar1 = create(:instrument, name: "Gibson", dealer_id: 1, on_sale: true)
      guitar2 = create(:instrument, name: "Jackson Dinky", dealer_id: 1, on_sale: true)
      guitar3 = create(:instrument, name: "ESP", dealer_id: 1, on_sale: true)
      guitar4 = create(:instrument, name: "Jackson Dinky", dealer_id: 1, on_sale: true)

      visit "/instruments"
      fill_in :search, :with => "ESP"
      click_button("Search")
      expect(current_path).to eq("/instruments")
      expect(page).to have_content(guitar3.name)
      expect(page).not_to have_content(guitar4.name)
      expect(page).not_to have_content(guitar1.name)
      expect(page).not_to have_content(guitar2.name)
    end
  end
end
