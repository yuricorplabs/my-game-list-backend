# frozen_string_literal: true

# Helper that injects index calls to models that needs to be indexed
module IndexSearchHelper
  extend ActiveSupport::Concern

  included do
    after_save :dispatch_index_search
  end

  def dispatch_index_search
    return true unless previous_changes[indexed_attribute]

    IndexSearchJob.perform_later(id, self.class.name, public_send(indexed_attribute))
  end
end
