require 'rails_helper'

RSpec.describe Teacher, type: :model do
  describe 'validations' do
      it {should validate_presence_of :name}
    end

    describe 'relationships' do
      it {should belong_to :school}
    end
end
