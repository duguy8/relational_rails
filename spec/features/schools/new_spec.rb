require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit the School Index page' do
    it 'link takes us to "/schools/new"' do

      visit '/schools'
      click_link "Create School"
      fill_in 'name', :with => 'Great School'
      expect(current_path).to eq("/schools/new")
      click_button 'Create School'
      expect(School.all.count).to eq 1
      expect(page).to have_content(School)
    end
  end

  describe 'When I visit the School New and submit form' do
    it 'Can not create School without a name' do

      visit '/schools/new'
      click_button("Create School")
      expect(page).to have_content("School not created: Required information missing.")
      expect(page).to have_button('Create School')
    end
  end
end
