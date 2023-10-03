# frozen_string_literal: true

# Usage and Purpose:

# The GameSerializer class plays a crucial role in your application,
# especially when you need to respond to API
# requests by providing game data in a structured and standardized format.
# By including the JSONAPI::Serializer module and specifying the attributes to be serialized,
# you ensure that game data can be easily transformed into JSON API-compliant responses.

# This serializer can be utilized in your controllers to format game data
# before sending it as responses to API clients. For instance, when a client requests game information,
# the GameSerializer class can be used to convert the game model
# into a JSON response that adheres to the JSON API specification.
class GameSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :description, :year
  attributes :publisher do |object|
    object.publisher&.name
  end
end
