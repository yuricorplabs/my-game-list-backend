# frozen_string_literal: true

# Game Publisher
class Publisher < ApplicationRecord
  has_many :games, dependent: :destroy
end
