require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a School Index page" do
    it "Has a text box to search by keyword" do

      visit "/schools"
      expect(page).to have_button("Search")
    end

    it "Returns me to the same page after clicking on search button" do
      visit "/schools"
      click_button("Search")
      expect(current_path).to eq("/schools")
    end

    it "Only shows partial match records on the page" do
      school_1 = create(:school, name: "The Best School")
      school_2 = create(:school, name: "New School")
      school_3 = create(:school, name: "School is best")

      visit "/schools"
      fill_in :search, :with => "best"
      click_button("Search")
      expect(page).not_to have_content(school_2.name)
      expect(page).to have_content(school_1.name)
      expect(page).to have_content(school_3.name)
    end
  end

  describe "When I visit a Teacher Index page" do
    it "Has a text box to search by keyword" do
      visit "/teachers"
      expect(page).to have_button("Search")
    end

    it "Returns me to the same page after clicking on search button" do
      visit "/teachers"
      click_button("Search")
      expect(current_path).to eq("/teachers")
    end

    it "Only shows partial match records on the page" do
      school = create(:school, id: 1)
      teacher_1 = create(:teacher, name: "Super sweet teacher", school_id: 1, college_graduate: true)
      teacher_2 = create(:teacher, name: "Dat teacher", school_id: 1, college_graduate: true)
      teacher_3 = create(:teacher, name: "Sweet teacher", school_id: 1, college_graduate: true)

      visit "/teachers"
      fill_in :search, :with => "sweet"
      click_button("Search")
      expect(page).not_to have_content(teacher_2.name)
      expect(page).to have_content(teacher_1.name)
      expect(page).to have_content(teacher_3.name)
    end
  end
end
