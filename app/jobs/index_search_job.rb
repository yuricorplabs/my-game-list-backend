# frozen_string_literal: true

# Worker that indexes resources into searchable table
class IndexSearchJob < ApplicationJob
  queue_as :default

  def perform(resource_id, resource_type, search_term)
    searchable = Searchable.find_or_create_by(searchable_resource_id: resource_id,
                                              searchable_resource_type: resource_type)
    searchable.update(search_term:)
  end
end
