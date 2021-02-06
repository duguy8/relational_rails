FactoryBot.define do
  factory :dealer do
    # name { "Guitar Center" }
    # city { "Tampa" }
    # state { "FL" }
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
