require 'rails_helper'

RSpec.describe Instrument, type: :model do
  describe 'validations' do
      it {should validate_presence_of :brand}
    end

    describe 'relationships' do
      it {should belong_to :dealer}
    end
end
