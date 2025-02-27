FactoryBot.define do
  factory :user do
    email_address { "user@gmail.com" }
    password_digest { "digest_string" }
  end
end
