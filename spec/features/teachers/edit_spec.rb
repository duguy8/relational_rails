require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit "/teachers/:id"' do
    it 'I see a link to update the Teacher titled Update Teacher' do
      school_1 = School.create(
        name: 'Turing',
        address: '111 whatever st',
        city: 'Denver',
        state: 'CO',
        zipcode: '80223',
        gradeschool: false
      )

      teacher_1 = Teacher.create(
        school_id: 1,
        name: "Mike",
        college_graduate: true,
        salary: 70000
      )

      visit "/teachers/#{teacher_1.id}"
      expect(page).to have_link("Update Teacher")
    end
  end
  describe "After clicking the link" do
    it "Takes us to '/teachers/:id/edit' where theres a form to edit" do
      school_1 = School.create(
        name: 'Turing',
        address: '111 whatever st',
        city: 'Denver',
        state: 'CO',
        zipcode: '80223',
        gradeschool: false
      )

      teacher_1 = Teacher.create(
        school_id: 1,
        name: "Mike",
        college_graduate: true,
        salary: 70000
      )

      visit "/teachers/#{teacher_1.id}"
      click_link "Update Teacher"
      expect(current_path).to eq("/teachers/#{teacher_1.id}/edit")
    end
  end
  describe "On Teachers Edit page there is a form and when submitting" do
    it "Sends patch request to '/teachers/:id', redirected to teacher show page" do
      school_1 = School.create(
        name: 'Turing',
        address: '111 whatever st',
        city: 'Denver',
        state: 'CO',
        zipcode: '80223',
        gradeschool: false
      )

      teacher_1 = Teacher.create(
        school_id: 1,
        name: "Mike",
        college_graduate: true,
        salary: 70000
      )

      visit "/teachers/#{teacher_1.id}"
      click_link "Update Teacher"
      expect(current_path).to eq("/teachers/#{teacher_1.id}/edit")
      expect(page).to have_button("Update Teacher")

      fill_in "teacher[name]", :with => "Bob"
      click_button "Update Teacher"
      expect(current_path).to eq("/teachers/#{teacher_1.id}")
      expect(page).to have_content("Bob")
    end
  end
end
