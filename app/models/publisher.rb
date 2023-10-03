# frozen_string_literal: true

# Game Publisher
class Publisher < ApplicationRecord
  include IndexSearchHelper
  attribute :indexed_attribute, default: -> { :name }

  has_many :games, dependent: :destroy
  has_one :searchable, as: :searchable_resource, dependent: :destroy

  validates :name, presence: true
end
