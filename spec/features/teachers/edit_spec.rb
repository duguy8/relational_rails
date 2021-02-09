require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit the School index or a Schools Teacher index" do
    it "Each Teacher has a link to be updated" do
      school = create(:school, id: 1)
      teacher_1 = create(:teacher, school_id: 1, college_graduate: true)
      teacher_2 = create(:teacher, school_id: 1, college_graduate: true)
      teacher_3 = create(:teacher, school_id: 1, college_graduate: true)

      visit "/teachers"
      expect(page).to have_content(teacher_1.name)
      expect(page).to have_content(teacher_2.name)
      expect(page).to have_content(teacher_3.name)
      expect(page).to have_link("Update Teacher")

      visit "/schools/#{school.id}/teachers"
      expect(page).to have_content(teacher_1.name)
      expect(page).to have_content(teacher_2.name)
      expect(page).to have_content(teacher_3.name)
      expect(page).to have_link("Update Teacher")
    end
  end

  describe "Should take me to the Teacher Edit page, and update it" do
    it "Should update from the Teacher Index" do
      school = create(:school, id: 1)
      teacher_1 = create(:teacher, school_id: 1, college_graduate: true, name: "SHS")

      visit "/teachers"
      click_link("Update Teacher")
      expect(current_path).to eq("/teachers/#{teacher_1.id}/edit")
      expect(page).to have_button("Update Teacher")
      fill_in "name", :with => "SJHS"
      click_button "Update Teacher"
      expect(current_path).to eq("/teachers/#{teacher_1.id}")
      expect(page).to have_content("SJHS")
    end

    it "Should also update from the Schools Teacher Index" do
      school = create(:school, id: 1)
      teacher_1 = create(:teacher, school_id: 1, college_graduate: true, name: "SHS")

      visit "/schools/#{school.id}/teachers"
      click_link("Update Teacher")
      expect(current_path).to eq("/teachers/#{teacher_1.id}/edit")
      expect(page).to have_button("Update Teacher")
      fill_in "name", :with => "SJHS"
      click_button "Update Teacher"
      expect(current_path).to eq("/teachers/#{teacher_1.id}")
      expect(page).to have_content("SJHS")
    end
  end

  describe 'When I visit "/teachers/:id"' do
    it 'I see a link to update the Teacher titled Update Teacher' do
      teacher_1 = create(:teacher)

      visit "/teachers/#{teacher_1.id}"
      expect(page).to have_link("Update Teacher")
    end
  end
  describe "After clicking the link" do
    it "Takes us to '/teachers/:id/edit' where theres a form to edit" do
      teacher_1 = create(:teacher)

      visit "/teachers/#{teacher_1.id}"
      click_link "Update Teacher"
      expect(current_path).to eq("/teachers/#{teacher_1.id}/edit")
    end
  end
  describe "On Teachers Edit page there is a form and when submitting" do
    it "Sends patch request to '/teachers/:id', redirected to teacher show page" do
      teacher_1 = create(:teacher)

      visit "/teachers/#{teacher_1.id}"
      click_link "Update Teacher"
      expect(current_path).to eq("/teachers/#{teacher_1.id}/edit")
      expect(page).to have_button("Update Teacher")
      fill_in "name", :with => "Bob"
      click_button "Update Teacher"
      expect(current_path).to eq("/teachers/#{teacher_1.id}")
      expect(page).to have_content("Bob")
    end
  end
end
