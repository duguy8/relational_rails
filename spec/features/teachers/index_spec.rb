require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I vist "/teachers"' do
    it 'Should list every teacher and its attributes' do
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
        id: 1,
        school_id: 1,
        name: "Mike",
        college_graduate: true,
        salary: 70000
      )

      visit '/teachers'
      expect(page).to have_content(teacher_1.name)
      expect(teacher_1.college_graduate).to be_truthy
      expect(page).to have_content(teacher_1.salary)
    end
  end
  describe 'When I visit "/schools/:school.id/teachers"' do
    it 'Shows each teacher that is associated with its school' do
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
        id: 1,
        school_id: 1,
        name: "Mike",
        college_graduate: true,
        salary: 70000
      )

      visit "/schools/#{school_1.id}/teachers"
      expect(page).to have_content(teacher_1.name)
      expect(teacher_1.college_graduate).to be_truthy
      expect(page).to have_content(teacher_1.salary)
    end
  end
end
