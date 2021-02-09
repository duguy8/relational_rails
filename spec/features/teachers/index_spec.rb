require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I vist "/teachers"' do
    it 'Should list every teacher and its attributes' do
      teacher_1 = create(:teacher, college_graduate: true)

      visit '/teachers'
      expect(page).to have_content(teacher_1.name)
      expect(teacher_1.college_graduate).to be_truthy
      expect(page).to have_content(teacher_1.salary)
    end

    it 'Should only display teachers with a college degree' do
      teacher_1 = create(:teacher, college_graduate: true)
      teacher_2 = create(:teacher, college_graduate: false)
      teacher_3 = create(:teacher, college_graduate: true)
      teacher_4 = create(:teacher, college_graduate: false)

      visit '/teachers'
      expect(page).to have_content(teacher_1.name)
      expect(page).to have_content(teacher_3.name)
      expect(page).not_to have_content(teacher_2.name)
      expect(page).not_to have_content(teacher_4.name)
    end
  end

  describe 'When I visit "/schools/:school.id/teachers"' do
    it 'Shows each teacher that is associated with its school' do
      teacher_1 = create(:teacher, college_graduate: true)
      school_1 = teacher_1.school

      visit "/schools/#{school_1.id}/teachers"
      expect(page).to have_content(teacher_1.name)
      expect(teacher_1.college_graduate).to be_truthy
      expect(page).to have_content(teacher_1.salary)
    end
  end

  describe 'As a visitor on the Teacher Index page'do
    it 'Has a form with an input number value' do
      teacher_1 = create(:teacher, college_graduate: true)
      school_1 = teacher_1.school

      visit "/schools/#{school_1.id}/teachers"
      expect(page).to have_content(teacher_1.name)
      expect(page).to have_button("Find Teachers")
    end

    it 'Show only Teachers with salary greater than $20_000' do
      school_1 = create(:school, id: 1)
      teacher_1 = create(:teacher, salary: 21_000, school_id: 1)
      teacher_2 = create(:teacher, salary: 10_000, school_id: 1)
      teacher_3 = create(:teacher, salary: 50_000, school_id: 1)

      visit "/schools/#{school_1.id}/teachers"
      fill_in :amount, :with => "20_000"
      click_button("Find Teachers")
      expect(current_path).to eq("/schools/#{school_1.id}/teachers")
      expect(page).to have_content(teacher_1.name)
      expect(page).to have_content(teacher_3.name)
      expect(page).not_to have_content(teacher_2.name)
    end
  end
end
