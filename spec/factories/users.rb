# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'sample@email.com' }
    password { 'Pass!123' }
    name { Faker::Name.name }
  end
end
