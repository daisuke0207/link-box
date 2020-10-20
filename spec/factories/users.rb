FactoryBot.define do
  factory :user do
    nickname { 'jack' }
    email { Faker::Internet.unique.free_email }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
