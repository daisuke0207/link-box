FactoryBot.define do
  factory :box do
    name { 'first' }
    position { 1 }
    association :user
  end
end
