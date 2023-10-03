# frozen_string_literal: true

# Usage and Purpose:

# The PublisherSerializer class plays a crucial role in your application,
# especially when you need to respond to API
# requests by providing publisher data in a structured and standardized format.
# By including the JSONAPI::Serializer module and specifying the attributes to be serialized,
# you ensure that publisher data can be easily transformed into JSON API-compliant responses.

# This serializer can be utilized in your controllers to format publisher data
# before sending it as responses to API clients. For instance, when a client requests publisher information,
# the PublisherSerializer class can be used to convert the publisher model
# into a JSON response that adheres to the JSON API specification.
class PublisherSerializer
  include JSONAPI::Serializer
  attributes :id, :name
end
