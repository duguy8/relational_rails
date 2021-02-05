require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a School's Teacher Index page" do
    it "Has a link to add a new adoptable teacher for that School Create Teacher" do
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
        salary: 80000
      )

      teacher_2 = Teacher.create(
        id: 2,
        school_id: 1,
        name: "Bob",
        college_graduate: true,
        salary: 70000
      )

      teacher_3 = Teacher.create(
        id: 3,
        school_id: 1,
        name: "Megan",
        college_graduate: true,
        salary: 60000
      )

      visit "/schools/#{school_1.id}/teachers"

      expect(current_path).to eq("/schools/#{school_1.id}/teachers")
      expect(page).to have_link('Create Teacher')
    end

    it 'Takes us ".../teachers/new" Where there is a form for a new teacher' do
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

      teacher_2 = Teacher.create(
        id: 2,
        school_id: 1,
        name: "Bob",
        college_graduate: true,
        salary: 70000
      )

      teacher_3 = Teacher.create(
        id: 3,
        school_id: 1,
        name: "Megan",
        college_graduate: true,
        salary: 60000
      )

      visit "/schools/#{school_1.id}/teachers"
      click_link 'Create Teacher'
      expect(current_path).to eq("/schools/#{school_1.id}/teachers/new")
      expect(page).to have_button('Create Teacher')
    end
  end

  describe 'A post request is sent, a new teacher is created for the school' do
    it 'Takes us to the Schools Teacher Page with the new one listed' do
      school_1 = School.create(
        id: 1,
        name: 'Turing',
        address: '111 whatever st',
        city: 'Denver',
        state: 'CO',
        zipcode: '80223',
        gradeschool: false
      )

      visit "/schools/#{school_1.id}/teachers"
      click_link 'Create Teacher'
      fill_in "teacher[name]", :with => "New Teacher"
      fill_in "teacher[salary]", :with => 50000
      click_button 'Create Teacher'

      expect(current_path).to eq("/schools/#{school_1.id}/teachers")
      expect(page).to have_content("New Teacher")
      expect(page).to have_content(50000)
    end
  end
end
