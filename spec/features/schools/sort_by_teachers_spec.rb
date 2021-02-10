require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I see the Schools Index Page' do
    it 'Has a link to sort schools by number of teachers' do

      visit "/schools"
      expect(page).to have_link("See Schools by Number of Teachers")
    end

    it 'Takes me back to the School Index' do
      visit "/schools"
      click_link("See Schools by Number of Teachers")
      expect(current_path).to eq("/schools")
    end

    it 'Shows School from most teachers to least with number next to each school' do
      school_1 = create(:school, id: 1)
      school_2 = create(:school, id: 2)
      school_3 = create(:school, id: 3)
      teacher_1 = create_list(:teacher, 4, school_id: 1, college_graduate: true)
      teacher_2 = create_list(:teacher, 3, school_id: 2, college_graduate: true)
      teacher_3 = create_list(:teacher, 7, school_id: 3, college_graduate: true)

      visit "/schools"
      click_link("See Schools by Number of Teachers")
      expect(school_3.name).to appear_before(school_1.name)
      expect(school_1.name).to appear_before(school_2.name)
      expect(school_3.name).to appear_before(school_2.name)
      expect(page).to have_content(school_1.teachers.count)
      expect(page).to have_content(school_2.teachers.count)
      expect(page).to have_content(school_3.teachers.count)
    end
  end
end
