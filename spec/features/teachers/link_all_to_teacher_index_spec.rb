require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'Every page has link to Teacher Index' do
    it 'Should have a link at the top of the page' do
      school = create(:school, id: 1)
      teacher_1 = create(:teacher, school_id: 1)

      visit "/teachers"
      expect(page).to have_link("View All Teachers")

      visit "/teachers/#{teacher_1.id}"
      expect(page).to have_link("View All Teachers")

      visit "/teachers/#{teacher_1.id}/edit"
      expect(page).to have_link("View All Teachers")

      visit "/schools"
      expect(page).to have_link("View All Teachers")

      visit "/schools/new"
      expect(page).to have_link("View All Teachers")

      visit "/schools/#{school.id}"
      expect(page).to have_link("View All Teachers")

      visit "/schools/#{school.id}/edit"
      expect(page).to have_link("View All Teachers")

      visit "/schools/#{school.id}/teachers"
      expect(page).to have_link("View All Teachers")

      visit "/schools/#{school.id}/teachers/new"
      expect(page).to have_link("View All Teachers")
    end

    it 'Actually takes you to Teacher Index' do
      visit "/schools"
      click_link("View All Teachers")
      expect(current_path).to eq("/teachers")
    end
  end
end
