# frozen_string_literal: true

FactoryBot.define do
  factory :game do
    name { 'MyString' }
    year { 'MyString' }
    description { 'MyText' }
    publisher
  end
end
