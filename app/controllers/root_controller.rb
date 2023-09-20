# frozen_string_literal: true

##
# RootController Class
#
# This controller serves as the root endpoint for the application.
# It handles the root URL ("/") and responds with a simple JSON message.
#
# Actions:
# - index: Display a greeting message (GET /)
#
# Example Usage:
# Access the root URL of the application to receive a greeting message in JSON format.
#
# ```
# GET /
# ```
#
# Response:
# ```json
# { "text": "Hello" }
# ```
#
# This controller is typically used to verify that the application is up and running.
#
# Note:
# - This controller inherits from ApplicationController, which provides common
#   functionality and configurations for the application's controllers.
class RootController < ApplicationController
  def index
    render json: { text: 'Hello' }
  end
end
