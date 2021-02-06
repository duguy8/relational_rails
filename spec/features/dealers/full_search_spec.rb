require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a Dealer Index page" do
    it "Has a text box to filter results by a keyword" do

      visit "/dealers"
      expect(page).to have_button("Search")
    end

    # it "Shows one record returned on the same page after pressing search button" do
    #   dealer1 = create(:dealer, name: "The Main Stop Shop")
    #   dealer2 = create(:dealer, name: "Amazingly Small Store")
    #   dealer3 = create(:dealer, name: "Underwater Emporium")
    #
    #   visit "/dealers"
    #   # save_and_open_page
    #   fill_in "Name", :with => "Underwater"
    #   click_button("Search")
    #   expect(current_path).to eq("/dealers")
    #   expect(page).to have_content(dealer3.name)
    #   expect(page).not_to have_content(dealer1.name)
    #   expect(page).not_to have_content(dealer2.name)
    # end

    # it "Shows more records returned on the same page after pressing search button" do
    #   dealer1 = create(:dealer, name: "The Main Stop Shop")
    #   dealer2 = create(:dealer, name: "Amazingly Small Store")
    #   dealer3 = create(:dealer, name: "Underwater Emporium")
    #   dealer4 = create(:dealer, name: "Amazingly Sweet Sweets")
    #
    #   visit "/dealers"
    #   fill_in "Name", :with => "Amazingly"
    #   click_button("Search")
    #   expect(current_path).to eq("/dealers")
    #   expect(page).to have_content(dealer2.name)
    #   expect(page).to have_content(dealer4.name)
    #   expect(page).not_to have_content(dealer1.name)
    #   expect(page).not_to have_content(dealer3.name)
    # end
  end

  describe "When I visit an Instruments Index page" do
    it "Has a text box to filter results by a keyword" do
      visit "/instruments"
      expect(page).to have_button("Search")
    end

    # it "Shows one record returned on the same page after pressing search button" do
    #   dealer = create(:dealer, name: "What Nice Guitars Inc", id: 1)
    #   guitar1 = create(:instrument, name: "Dunable", dealer_id: 1)
    #   guitar2 = create(:instrument, name: "PRS", dealer_id: 1)
    #   guitar3 = create(:instrument, name: "ESP", dealer_id: 1)
    #
    #   visit "/instruments"
    #   fill_in "Name", :with => "Dunable"
    #   click_button("Search")
    #   expect(current_path).to eq("/instruments")
    #   expect(page).to have_content(guitar1.name)
    #   expect(page).not_to have_content(guitar2.name)
    #   expect(page).not_to have_content(guitar3.name)
    # end
    #
    # it "Shows more records returned on the same page after pressing search button" do
    #   dealer = create(:dealer, name: "What Nice Guitars Inc", id: 1)
    #   guitar1 = create(:instrument, name: "Dunable", dealer_id: 1)
    #   guitar2 = create(:instrument, name: "Jackson Dinky", dealer_id: 1)
    #   guitar3 = create(:instrument, name: "ESP", dealer_id: 1)
    #   guitar4 = create(:instrument, name: "Jackson Warrior", dealer_id: 1)
    #
    #   visit "/instruments"
    #   fill_in "Name", :with => "Jackson"
    #   click_button("Search")
    #   expect(current_path).to eq("/instruments")
    #   expect(page).to have_content(guitar2.name)
    #   expect(page).to have_content(guitar4.name)
    #   expect(page).not_to have_content(guitar1.name)
    #   expect(page).not_to have_content(guitar3.name)
    # end
  end
end
