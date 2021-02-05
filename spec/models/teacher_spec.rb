require 'rails_helper'

RSpec.describe Teacher, type: :model do
  describe 'validations' do
      it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should belong_to :school}
  end

  describe 'class methods' do
    it 'Finds all teachers with a college degree' do
      school = create(:school, id: 1)
      teacher_1 = create(:teacher, school_id: 1, college_graduate: true)
      teacher_2 = create(:teacher, school_id: 1, college_graduate: false)
      teacher_3 = create(:teacher, school_id: 1, college_graduate: true)

      expected = school.teachers.college_graduates
      expect(expected.count).to eq 2
      expect(expected[0].college_graduate).to eq(true)
      expect(expected[1].college_graduate).to eq(true)
    end

    it 'Filters salary to be greater than given amount' do
      school = create(:school, id: 1)
      teacher_1 = create(:teacher, school_id: 1, salary: 21_000)
      teacher_2 = create(:teacher, school_id: 1, salary: 10_000)
      teacher_3 = create(:teacher, school_id: 1, salary: 30_000)
      teacher_4 = create(:teacher, school_id: 1, salary: 61_000)

      expected = school.teachers.filter_salary(20_000)
      expect(expected.count).to eq 3
      expect(expected[0].salary).to eq(21_000)
      expect(expected[1].salary).to eq(30_000)
      expect(expected[2].salary).to eq(61_000)
    end

    it 'Orders by name' do
      school = create(:school, id: 1)
      teacher_1 = create(:teacher, school_id: 1, name: "A")
      teacher_2 = create(:teacher, school_id: 1, name: "C")
      teacher_3 = create(:teacher, school_id: 1, name: "B")

      teachers = Teacher.all.order_by_name
      expected = [teacher_1, teacher_3, teacher_2]

      expect(teachers).to eq(expected)
    end
  end
end
