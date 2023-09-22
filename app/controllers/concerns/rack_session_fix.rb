# frozen_string_literal: true

# concert to stub rack session to avoid action dispatch error
# its because devise aways ask if session is enabled by accessing rack.session request object
module RackSessionFix
  extend ActiveSupport::Concern

  # a class just to act like a hash and respond to enabled? method to devise registrations controller
  class FakeRackSession < Hash
    def enabled?
      false
    end
  end
  included do
    before_action :set_fake_rack_session_for_devise

    private

    def set_fake_rack_session_for_devise
      request.env['rack.session'] ||= FakeRackSession.new
    end
  end
end
