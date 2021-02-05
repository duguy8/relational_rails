FactoryBot.define do
  factory :instrument do
    sequence :name do |n|
      "Cyclops #{n}"
    end
    sequence :brand do |n|
      "Dunable #{n}"
    end
    sequence :price do |n|
      n * 2
    end
    dealer
  end
end
