FactoryBot.define do
  factory :dealer do
    sequence :name do |n|
      "Guitar Center #{n}"
    end
    sequence :city do |n|
      "Tampa #{n}"
    end
    sequence :state do |n|
      "FL #{n}"
    end
  end
end
