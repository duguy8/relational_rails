require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a Dealer Index page" do
    it "Has a text box to filter results by a keyword" do

      visit "/dealers"
      expect(page).to have_button("Search")
    end
    it "Shows one or more records returned on the same page after pressing search button" do
    end
  end

  describe "When I visit an Instruments Index page" do
    it "Has a text box to filter results by a keyword" do
      visit "/instruments"
      expect(page).to have_button("Search")
    end
    it "Shows one or more records returned on the same page after pressing search button" do
    end
  end
end
