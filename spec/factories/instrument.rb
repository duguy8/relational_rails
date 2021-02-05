FactoryBot.define do
  factory :instrument do
    sequence(:name) {|n| "Cyclops #{n}"}
    sequence(:brand) {|n| "Dunable #{n}"}
    sequence(:price) {|n| n * 2}
    dealer
  end
end
