require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit "/schools"' do
    it 'shows a link next to each school to be updated' do
      school_1 = create(:school)
      school_2 = create(:school)

      visit "/schools"
      expect(page).to have_link("Update School")
      expect(page).to have_content(school_1.name)
      expect(page).to have_content(school_2.name)
    end
  end

  describe 'When I click the link to update the School' do
    it 'Takes me to the schools edit page' do
      school_1 = create(:school, name: "New School Name")

      visit "/schools"
      click_link("Update School")
      expect(current_path).to eq("/schools/#{school_1.id}/edit")
    end

    it "Actually updates the school" do
      school_1 = create(:school, name: "New School Name")

      visit "/schools"
      click_link("Update School")
      fill_in "school[name]", :with => "Middle School"
      click_button "Update School"
      expect(current_path).to eq("/schools/#{school_1.id}")
      expect(page).to have_content("Middle School")
    end
  end

  describe 'When I visit a School show page' do
    it 'Then I see a link to update the parent "Update School"' do
      school_1 = create(:school)

      visit "/schools/#{school_1.id}"
      expect(page).to have_link('Update School')
    end

    it 'When I click the link "Update School"' do
      school_1 = create(:school)

      visit "/schools/#{school_1.id}"
      click_link 'Update School'
      expect(current_path).to eq("/schools/#{school_1.id}/edit")
    end

    it 'When I fill out the form with updated information and I click the button to submit the form' do
      school_1 = create(:school)

      visit "/schools/#{school_1.id}"
      expect(page).to have_link('Update School')
      click_link 'Update School'
      expect(current_path).to eq("/schools/#{school_1.id}/edit")

      fill_in "school[name]", :with => 'Great School'
      click_button 'Update School'
      expect(current_path).to eq("/schools/#{school_1.id}")
      expect(page).to have_content('Great School')
    end
  end
end
