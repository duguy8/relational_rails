require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I vist "/teachers/:id"' do
    it 'Should have the teacher with that id and its attributes' do
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

      visit "/teachers/#{teacher_1.school_id}"
      expect(page).to have_content(teacher_1.name)
      expect(page).to have_content(teacher_1.college_graduate)
      expect(page).to have_content(teacher_1.salary)
    end
  end
end
