# frozen_string_literal: true

# Game entity
class Game < ApplicationRecord
  belongs_to :publisher
end
