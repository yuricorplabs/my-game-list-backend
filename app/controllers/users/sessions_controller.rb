# frozen_string_literal: true

module Users
  # Login/logout controller for users
  class SessionsController < Devise::SessionsController
    respond_to :json
  end
end
