# frozen_string_literal: true

# The User model serves as the core component for managing user accounts and authentication in your application.
# It integrates with Devise to provide a comprehensive set of authentication features,
# including password-based authentication, token-based authentication using JWTs,
# account registration, password recovery, and more.

# The inclusion of Devise::JWT::RevocationStrategies::JTIMatcher and the configuration for JWT authentication
# and revocation strategies indicate that your application is using JWTs for secure authentication
# and may have a customized approach to token revocation based on the logic defined within the User model.
class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
end
