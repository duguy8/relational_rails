require 'rails_helper'

RSpec.describe School, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :teachers}
  end

  describe 'class methods' do
    it 'Orders schools by recently created first' do
      school_1 = create(:school, created_at: "08-01-1983")
      school_2 = create(:school, created_at: "11-01-1990")
      school_3 = create(:school, created_at: "01-01-2020")

      schools = School.all.order_by_created_at
      expected = [school_3, school_2, school_1]

      expect(schools).to eq(expected)
    end

    it 'Search finds a school by name' do
      school1 = create(:school, name: "A School")
      school2 = create(:school, name: "B School")
      school3 = create(:school, name: "SHS")

      schools = School.all
      expected = [school1]
      bad1 = [school2]
      bad2 = [school3]
      expect(schools.search("A School")).to eq(expected)
      expect(schools.search("A School")).to_not eq(bad1)
      expect(schools.search("A School")).to_not eq(bad2)
    end

    it 'Search finds a school by partial name' do
      school1 = create(:school, name: "A School")
      school2 = create(:school, name: "B School")
      school3 = create(:school, name: "SHS b")

      schools = School.all
      expected = [school2, school3]
      bad = [school1]
      expect(schools.partial_search("b")).to eq(expected)
      expect(schools.partial_search("b")).to_not eq(bad)
    end

    it 'Returns number of teachers per school' do
      school_1 = create(:school, id: 1)
      school_2 = create(:school, id: 2)
      school_3 = create(:school, id: 3)

      teacher_1 = create_list(:teacher, 4, school_id: 1)
      teacher_2 = create_list(:teacher, 3, school_id: 2)
      teacher_3 = create_list(:teacher, 7, school_id: 3)

      schools = School.all.order_by_teacher_count
      expected = [school_3, school_1, school_2]

      expect(schools).to eq(expected)
    end
  end
end
