FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "user-#{i}@test.com" }
    password 'password'
  end
end