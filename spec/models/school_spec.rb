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
  end
end
