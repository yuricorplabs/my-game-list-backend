# frozen_string_literal: true

FactoryBot.define do
  factory :game do
    name { Faker::Game.title }
    year { rand(1980..2023) }
    description { Faker::Lorem.paragraph }
    publisher
  end
end
