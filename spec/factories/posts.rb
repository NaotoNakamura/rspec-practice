FactoryBot.define do
  factory :post do
    association :user
    body {"LoremIpsum"}
  end
end
