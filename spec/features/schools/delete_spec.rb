require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit "/schools"' do
    it 'Shows a link next to each school to be deleted' do
      school_1 = create(:school)
      school_2 = create(:school)

      visit "/schools"
      expect(page).to have_link("Delete School")
      expect(page).to have_content(school_1.name)
      expect(page).to have_content(school_2.name)
    end

    it 'Deletes school when "Delete School" is clicked' do
      school_1 = create(:school, name: "New School")

      visit "/schools"
      click_link("Delete School")
      expect(current_path).to eq("/schools")
      expect(page).not_to have_content(school_1.name)
    end
  end

  describe 'When I visit a School show page' do
    it 'Then I see a link to the delete School' do
      school_1 = create(:school)

      visit "/schools/#{school_1.id}"
      expect(page).to have_link('Delete School')
    end
    it 'When I click the link "Delete School"' do
      school_1 = create(:school)

      visit "/schools/#{school_1.id}"
      click_link 'Delete School'
      expect(page).not_to have_content(school_1.name)
      expect(current_path).to eq("/schools")
    end
  end
end
