FactoryBot.define do
  factory :dealer do
    sequence(:name) {|n| "Guitar Center #{n}"}
    sequence(:city) {|n| "Tampa #{n}"}
    sequence(:state) {|n| "FL #{n}"}
  end
end
