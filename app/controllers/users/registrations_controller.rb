# frozen_string_literal: true

module Users
  # Registration controller for users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json
  end
end
