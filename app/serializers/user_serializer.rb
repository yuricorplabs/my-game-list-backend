# frozen_string_literal: true

# Usage and Purpose:

# The UserSerializer class plays a crucial role in your application,
# especially when you need to respond to API
# requests by providing user data in a structured and standardized format.
# By including the JSONAPI::Serializer module and specifying the attributes to be serialized,
# you ensure that user data can be easily transformed into JSON API-compliant responses.

# This serializer can be utilized in your controllers to format user data
# before sending it as responses to API clients. For instance, when a client requests user information,
# the UserSerializer class can be used to convert the user model
# into a JSON response that adheres to the JSON API specification.
class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name
end
