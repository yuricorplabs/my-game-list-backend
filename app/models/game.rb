# frozen_string_literal: true

# Game entity
class Game < ApplicationRecord
  include IndexSearchHelper
  attribute :indexed_attribute, default: -> { :name }

  belongs_to :publisher
  has_one :searchable, as: :searchable_resource, dependent: :destroy

  validates :name, presence: true
end
