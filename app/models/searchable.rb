# frozen_string_literal: true

# This model stores searches indexes
# it is used for games full text search
class Searchable < ApplicationRecord
  belongs_to :searchable_resource, polymorphic: true
end
