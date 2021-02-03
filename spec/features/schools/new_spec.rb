require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit the School Index page' do
    it 'link takes us to "/schools/new"' do
      # school_1 = School.create(
      #   id: 1,
      #   name: 'Turing'
      # )
      # school_2 = School.create(
      #   id: 2,
      #   name: 'UCA'
      # )

      visit '/schools'
      click_link "Create School"
      fill_in 'school[name]', :with => 'Great School'
      
      expect(current_path).to eq("/schools/new")
      click_button 'Create School'
      expect(School.all.count).to eq 1
      expect(page).to have_content(School)
    end
  end
end


# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.
