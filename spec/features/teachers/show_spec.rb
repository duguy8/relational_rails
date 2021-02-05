require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I vist "/teachers/:id"' do
    it 'Should have the teacher with that id and its attributes' do
      teacher_1 = create(:teacher)

      visit "/teachers/#{teacher_1.id}"
      expect(page).to have_content(teacher_1.name)
      expect(teacher_1.college_graduate).to be_falsey
      expect(page).to have_content(teacher_1.salary)
    end
  end
end
