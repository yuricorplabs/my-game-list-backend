# frozen_string_literal: true

# Helper to set auth tokens to requests
module SessionsHelper
  extend RSpec::SharedContext

  let(:headers_without_authorization) { { 'Accept' => 'application/json', 'Content-Type' => 'application/json' } }
  let(:auth_headers) { Devise::JWT::TestHelpers.auth_headers(headers_without_authorization, user) }
end
