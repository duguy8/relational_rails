require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit "/schools"' do
    it 'I see every school' do
      school_1 = create(:school)
      school_2 = create(:school)

      visit '/schools'

      expect(page).to have_content(school_1.name)
      expect(page).to have_content(school_2.name)
    end

    it 'Is sorted by most recently created, with created time shown' do
      school_1 = create(:school, created_at: "1990-11-01")
      school_2 = create(:school, created_at: "2020-01-01")

      visit '/schools'
      expect(school_2.name).to appear_before(school_1.name)
    end
  end
end
