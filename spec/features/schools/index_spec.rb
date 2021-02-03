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

      expect(page).to have_content(school_1.name)
      expect(page).to have_content(school_2.name)
    end
  end
end
