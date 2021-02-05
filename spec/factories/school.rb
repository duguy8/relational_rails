FactoryBot.define do
  factory :school do
    sequence :name do |n|
      "Turing #{n}"
    end
    sequence :address do |n|
      "123 Street #{n}"
    end
    sequence :city do |n|
      "Denver #{n}"
    end
    sequence :state do |n|
      "CO #{n}"
    end
  end
end
