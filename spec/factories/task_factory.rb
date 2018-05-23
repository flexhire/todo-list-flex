FactoryBot.define do
  factory :task do
    name { FFaker::Name.name }
    due_date { Time.now + 10.days }
    user
  end
end
