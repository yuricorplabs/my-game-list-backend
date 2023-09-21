# frozen_string_literal: true

# Usage and Purpose:

# This ApplicationController is typically the parent controller
# for other controllers in your Rails application.
# By implementing the before_action filter and configure_permitted_parameters method,
# it enhances the functionality of Devise for user authentication.
# Specifically, it ensures that the :name attribute can be processed during sign-up
# and account updates, which may not be allowed by default in Devise.

# The configure_permitted_parameters method is responsible for
# configuring which parameters are permitted during user sign-up and account update operations.
# Specifically, it customizes parameter sanitization for the Devise gem with the following actions:

# devise_parameter_sanitizer.permit(:sign_up, keys: %i[name]):
# This line allows the :name attribute to be accepted as a parameter during the user sign-up process.
# It enables you to capture and store the user's name when they create an account.

# devise_parameter_sanitizer.permit(:account_update, keys: %i[name]):
# This line permits the :name attribute to be passed as a parameter when a user updates their account information.
class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name])
  end
end
