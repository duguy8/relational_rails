require 'rails_helper'

RSpec.describe 'As a visitor' do
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

      visit "/teachers/#{teacher_1.id}"
      expect(page).to have_link("Delete Teacher")
      click_link "Delete Teacher"
      expect(current_path).to eq('/teachers')
      expect(page).not_to have_content(teacher_1.name)
    end
  end
end
