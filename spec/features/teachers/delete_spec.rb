require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'See a link to delete next to each Teacher' do
    it 'Has link on Teacher Index page' do
    school = create(:school, id: 1)
    teacher_1 = create(:teacher, school_id: 1, college_graduate: true, name: "SHS")

    visit "/teachers"
    expect(page).to have_content(teacher_1.name)
    expect(page).to have_link("Delete Teacher")

    end

    it 'Has link on School Teacher Index' do
      school = create(:school, id: 1)
      teacher_1 = create(:teacher, school_id: 1, college_graduate: true, name: "SHS")

      visit "/schools/#{school.id}/teachers"
      expect(page).to have_content(teacher_1.name)
      expect(page).to have_link("Delete Teacher")
    end

    it 'Deletes Teacher and taken back to Teacher Index from Teacher Index' do
      school = create(:school, id: 1)
      teacher_1 = school.teachers.create!({
        id: 1,
        school_id: 1,
        name: "SJH",
        college_graduate: true,
        salary: 1000,
        created_at: "2020-10-10",
        updated_at: "2020-10-11",
        })

      visit "/teachers"
      click_link("Delete Teacher")
      expect(current_path).to eq("/schools/#{school.id}/teachers")
      expect(page).not_to have_content(teacher_1.name)
    end

    it 'Deletes Teacher and taken back to Teacher Index from Schools Teacher Index' do
      school = create(:school, id: 1)
      teacher_1 = school.teachers.create!({
        id: 1,
        school_id: 1,
        name: "SJH",
        college_graduate: true,
        salary: 1000,
        created_at: "2020-10-10",
        updated_at: "2020-10-11",
        })

      visit "/schools/#{school.id}/teachers"
      click_link("Delete Teacher")
      expect(current_path).to eq("/schools/#{school.id}/teachers")
      expect(page).not_to have_content(teacher_1.name)
    end
  end

  describe 'When I vist "/teachers/:id"' do
    it 'Should have a link to Delete Teacher' do
      teacher_1 = create(:teacher)

      visit "/teachers/#{teacher_1.id}"
      expect(page).to have_link("Delete Teacher")
    end
  end
  describe "When I click the link" do
    it "Teacher is deleted and redirected to Teacher index page" do
      teacher_1 = create(:teacher)
      school = teacher_1.school

      visit "/teachers/#{teacher_1.id}"
      expect(page).to have_link("Delete Teacher")
      click_link "Delete Teacher"
      expect(current_path).to eq("/schools/#{school.id}/teachers")
      expect(page).not_to have_content(teacher_1.name)
    end
  end
end
