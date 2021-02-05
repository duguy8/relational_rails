require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I vist "/teachers/:id"' do
    it 'Should have a link to Delete Teacher' do
      school_1 = School.create(
        id: 1,
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

      visit "/teachers/#{teacher_1.school_id}"
      expect(page).to have_link("Delete Teacher")
    end
  end
  describe "When I click the link" do
    it "Teacher is deleted and redirected to Teacher index page" do
      school_1 = School.create(
        id: 1,
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

      visit "/instruments/#{school_1.id}"
      click_link "Delete Teacher"
      expect(current_path).to eq('/instruments')
      expect(page).not_to have_content(teacher_1.name)
    end
  end
end
