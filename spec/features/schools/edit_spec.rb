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
      click_link 'Update School'
      expect(current_path).to eq("/schools/#{school_1.id}/edit")
    end
  end
end



# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info
