# frozen_string_literal: true

# It creates an searchable entry for resource
class IndexSearchJob
  include Sidekiq::Job

  def perform(resource_id, resource_type, search_term)
    searchable = Searchable.find_or_create_by(searchable_resource_id: resource_id,
                                              searchable_resource_type: resource_type)
    searchable.update(search_term:)
  end
end
