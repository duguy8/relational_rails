require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit "/schools"' do
    it 'I see every school' do
      school_1 = School.create(
        id: 1,
        name: 'Turing'
      )
      school_2 = School.create(
        id: 2,
        name: 'UCA'
      )

      visit '/schools'
      # save_and_open_page
      expect(page).to have_content(school_1.name)
      expect(page).to have_content(school_2.name)
    end
  end

  describe 'When I visit "/schools/:id"' do
    it 'I see a school with that id with its attributes' do
      school_1 = School.create(
        id: 1,
        name: 'Turing',
        city: 'Denver'
      )

      visit "/schools/#{school_1.id}"
      # save_and_open_page
      expect(school_1.id).to eq 1
      expect(page).to have_content(school_1.city)
      expect(school_1.city).to eq 'Denver'
    end
  end
end
