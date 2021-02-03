require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit "/schools/:id"' do
    it 'I see a school with that id with its attributes' do
      school_1 = School.create(
        id: 1,
        name: 'Turing',
        address: '111 whatever st',
        city: 'Denver',
        state: 'CO',
        zipcode: '80223',
        gradeschool: false,
        created_at: "10-10-2013",
        updated_at: "2-2-2021"
      )

      visit "/schools/#{school_1.id}"
      expect(school_1.id).to eq 1
      expect(school_1.city).to eq 'Denver'
      expect(page).to have_content(school_1.name)
      expect(page).to have_content(school_1.address)
      expect(page).to have_content(school_1.city)
      expect(page).to have_content(school_1.state)
      expect(page).to have_content(school_1.zipcode)
      expect(page).to have_content(school_1.gradeschool)
      expect(page).to have_content(school_1.created_at)
      expect(page).to have_content(school_1.updated_at)
    end
  end
end
