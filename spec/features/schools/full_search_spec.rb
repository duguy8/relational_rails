require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a School Index page" do
    it "Has a text box to filter results by a keyword" do

      visit "/schools"
      expect(page).to have_button("Search")
    end
    it "Shows one or more records returned on the same page after pressing search button" do
    end
  end

  describe "When I visit an Teachers Index page" do
    it "Has a text box to filter results by a keyword" do
      visit "/teachers"
      expect(page).to have_button("Search")
    end
    it "Shows one or more records returned on the same page after pressing search button" do
    end
  end
end
