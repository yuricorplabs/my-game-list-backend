# frozen_string_literal: true

# Usage and Purpose:

# The GameSearchSerializer class plays a crucial role in your application,
# especially when you need to respond to API
# requests by providing game_search data in a structured and standardized format.
# By including the JSONAPI::Serializer module and specifying the attributes to be serialized,
# you ensure that game_search data can be easily transformed into JSON API-compliant responses.

# This serializer can be utilized in your controllers to format game_search data
# before sending it as responses to API clients. For instance, when a client requests game_search information,
# the GameSearchSerializer class can be used to convert the game_search model
# into a JSON response that adheres to the JSON API specification.
class GameSearchSerializer
  include JSONAPI::Serializer
  attributes :id, :name
end
