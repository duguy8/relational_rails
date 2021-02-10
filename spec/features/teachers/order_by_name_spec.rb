require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit the Schools Teacher Index Page' do
    it 'Shows a link to sort teachers in alphabetical order' do
      school = create(:school, id: 1)

      visit "/schools/#{school.id}/teachers"
      expect(page).to have_link("Sort Teachers by Name")
    end
  end

  describe 'After clicking link Im taken to Schools Teacher index page' do
    it 'Shows all Teachers in Alphabetical Order' do
      school = create(:school, id: 1)
      teacher_1 = create(:teacher, name: 'B', school_id: 1)
      teacher_2 = create(:teacher, name: 'C', school_id: 1)
      teacher_3 = create(:teacher, name: 'A', school_id: 1)

      visit "/schools/#{school.id}/teachers"
      click_link("Sort Teachers by Name")
      expect(teacher_3.name).to appear_before(teacher_2.name)
      expect(teacher_3.name).to appear_before(teacher_2.name)
      expect(teacher_3.name).to appear_before(teacher_1.name)
    end
  end
end
