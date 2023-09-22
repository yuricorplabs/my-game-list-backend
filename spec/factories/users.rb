# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { "#{Faker::Name.name.parameterize}@email.com" }
    password { SecureRandom.hex }
    name { Faker::Name.name }
  end
end
