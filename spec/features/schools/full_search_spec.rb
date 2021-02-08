require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a School Index page" do
    it "Has a text box to filter results by a keyword" do

      visit "/schools"
      expect(page).to have_button("Search")
    end

    it "Shows one record returned on the same page after pressing search button" do
      school_1 = create(:school, name: "SHS")
      school_2 = create(:school, name: "UCA")
      school_3 = create(:school, name: "Turing")

      visit "/schools"
      fill_in :search, :with => "Turing"
      click_button("Search")
      expect(current_path).to eq("/schools")
      expect(page).to have_content(school_3.name)
      expect(page).not_to have_content(school_1.name)
      expect(page).not_to have_content(school_2.name)
    end

    it "Shows more records returned on the same page after pressing search button" do
      school_1 = create(:school, name: "SHS")
      school_2 = create(:school, name: "UCA")
      school_3 = create(:school, name: "Turing")
      school_4 = create(:school, name: "UCA")

      visit "/schools"
      fill_in :search, :with => "UCA"
      click_button("Search")
      expect(current_path).to eq("/schools")
      expect(page).to have_content(school_2.name)
      expect(page).to have_content(school_4.name)
      expect(page).not_to have_content(school_1.name)
      expect(page).not_to have_content(school_3.name)
    end
  end

  describe "When I visit an Teachers Index page" do
    it "Has a text box to filter results by a keyword" do
      visit "/teachers"
      expect(page).to have_button("Search")
    end

    it "Shows one record returned on the same page after pressing search button" do
      school = create(:school, name: "SHS", id: 1)
      teacher_1 = create(:teacher, name: "Teacher name", school_id: 1, college_graduate: true)
      teacher_2 = create(:teacher, name: "Mike", school_id: 1, college_graduate: true)
      teacher_3 = create(:teacher, name: "Bob", school_id: 1, college_graduate: true)

      visit "/teachers"
      fill_in :search, :with => "Teacher name"
      click_button("Search")
      expect(current_path).to eq("/teachers")
      expect(page).to have_content(teacher_1.name)
      expect(page).not_to have_content(teacher_2.name)
      expect(page).not_to have_content(teacher_3.name)
    end

    it "Shows more records returned on the same page after pressing search button" do
      school = create(:school, name: "SHS", id: 1)
      teacher_1 = create(:teacher, name: "Gibson", school_id: 1, college_graduate: true)
      teacher_2 = create(:teacher, name: "Jackson Dinky", school_id: 1, college_graduate: true)
      teacher_3 = create(:teacher, name: "SJH", school_id: 1, college_graduate: true)

      visit "/teachers"
      fill_in :search, :with => "SJH"
      click_button("Search")
      expect(current_path).to eq("/teachers")
      expect(page).to have_content(teacher_3.name)
      expect(page).not_to have_content(teacher_1.name)
      expect(page).not_to have_content(teacher_2.name)
    end
  end
end
