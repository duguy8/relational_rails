require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit a School Show page' do
    it 'Should have a link to Schools Teachers Page' do
      school = create(:school, id: 1, name: "SHS")
      teacher_1 = create(:teacher, school_id: 1)

      visit "/schools/#{school.id}"
      expect(page).to have_link("All teachers employed at #{school.name}")
      click_link("All teachers employed at #{school.name}")
      expect(current_path).to eq("/schools/#{school.id}/teachers")
      expect(page).to have_content(teacher_1.name)
    end
  end
end
