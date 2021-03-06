require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a School's Teacher Index page" do
    it "Has a link to add a new adoptable teacher for that School Create Teacher" do
      school_1 = create(:school)

      visit "/schools/#{school_1.id}/teachers"

      expect(current_path).to eq("/schools/#{school_1.id}/teachers")
      expect(page).to have_link('Create Teacher')
    end

    it 'Takes us ".../teachers/new" Where there is a form for a new teacher' do
      school_1 = create(:school)

      visit "/schools/#{school_1.id}/teachers"
      click_link 'Create Teacher'
      expect(current_path).to eq("/schools/#{school_1.id}/teachers/new")
      expect(page).to have_button('Create Teacher')
    end
  end

  describe 'A post request is sent, a new teacher is created for the school' do
    it 'Takes us to the Schools Teacher Page with the new one listed' do
      school_1 = create(:school)

      visit "/schools/#{school_1.id}/teachers"
      click_link 'Create Teacher'
      fill_in "name", :with => "New Teacher"
      fill_in "salary", :with => 50_000
      check "college_graduate"
      click_button 'Create Teacher'

      expect(current_path).to eq("/schools/#{school_1.id}/teachers")
      expect(page).to have_content("New Teacher")
      expect(page).to have_content(50_000)
    end
  end

  describe 'When I visit the Teacher New page and submit form' do
    it 'Can not create Teacher without a name' do
      school = create(:school)

      visit "/schools/#{school.id}/teachers/new"
      click_button("Create Teacher")
      expect(page).to have_content("Teacher not created: Required information missing.")
      expect(page).to have_button('Create Teacher')
    end
  end
end
