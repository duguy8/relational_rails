require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit "/teachers/:id"' do
    it 'I see a link to update the Teacher titled Update Teacher' do
      teacher_1 = create(:teacher)

      visit "/teachers/#{teacher_1.id}"
      expect(page).to have_link("Update Teacher")
    end
  end
  describe "After clicking the link" do
    it "Takes us to '/teachers/:id/edit' where theres a form to edit" do
      teacher_1 = create(:teacher)

      visit "/teachers/#{teacher_1.id}"
      click_link "Update Teacher"
      expect(current_path).to eq("/teachers/#{teacher_1.id}/edit")
    end
  end
  describe "On Teachers Edit page there is a form and when submitting" do
    it "Sends patch request to '/teachers/:id', redirected to teacher show page" do
      teacher_1 = create(:teacher)

      visit "/teachers/#{teacher_1.id}"
      click_link "Update Teacher"
      expect(current_path).to eq("/teachers/#{teacher_1.id}/edit")
      expect(page).to have_button("Update Teacher")
      fill_in "teacher[name]", :with => "Bob"
      click_button "Update Teacher"
      expect(current_path).to eq("/teachers/#{teacher_1.id}")
      expect(page).to have_content("Bob")
    end
  end
end
