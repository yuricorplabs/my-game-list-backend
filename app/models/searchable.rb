# frozen_string_literal: true

# This model stores searches indexes
# it is used for games full text search
class Searchable < ApplicationRecord
  belongs_to :searchable_resource, polymorphic: true

  validates :search_term, presence: true

  scope :search, lambda { |resource_type, search_term|
    includes(:searchable_resource)
      .where(searchable_resource_type: resource_type)
      .where('search_term ILIKE ?', "%#{search_term}%")
      .limit(10)
  }
end
