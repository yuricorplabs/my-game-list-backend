# frozen_string_literal: true

# Helper methods for JSONAPI-SERIALIZER
module ResourceSerializer
  def serialize_collection(serializer, object)
    serializer.new(object).serializable_hash[:data].pluck(:attributes)
  end
end
