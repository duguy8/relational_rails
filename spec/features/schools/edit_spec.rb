require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit a School show page' do
    it 'Then I see a link to update the parent "Update School"' do
      school_1 = School.create(
        id: 1,
        name: 'Turing',
        address: '111 whatever st',
        city: 'Denver',
        state: 'CO',
        zipcode: '80223',
        gradeschool: false
      )

      visit "/schools/#{school_1.id}"
      expect(page).to have_link('Update School')
    end

    it 'When I click the link "Update School"' do
      school_1 = School.create(
        id: 1,
        name: 'Turing',
        address: '111 whatever st',
        city: 'Denver',
        state: 'CO',
        zipcode: '80223',
        gradeschool: false
      )

      visit "/schools/#{school_1.id}"
      expect(page).to have_link('Update School')
      click_link 'Update School'
      expect(current_path).to eq("/schools/#{school_1.id}/edit")
    end

    it 'When I fill out the form with updated information and I click the button to submit the form' do
      school_1 = School.create(
        id: 1,
        name: 'Turing',
        address: '111 whatever st',
        city: 'Denver',
        state: 'CO',
        zipcode: '80223',
        gradeschool: false
      )

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


# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info
