FactoryBot.define do
  factory :role do
    name { "MyString" }
    association :user

    trait :with_started_at do
      started_at { "2025-01-01 12:00:00" }
    end

    trait :with_ended_at do
      ended_at { "2025-02-01 12:00:00" }
    end

    trait :archived do
      archived_at { "2025-02-10 12:00:00" }
    end

    trait :deleted do
      deleted_at { "2025-02-27 12:00:00" }
    end
  end
end
