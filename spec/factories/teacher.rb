FactoryBot.define do
  factory :teacher do
    sequence :name do |n|
      "Mike #{n}"
    end
    school
  end
end
