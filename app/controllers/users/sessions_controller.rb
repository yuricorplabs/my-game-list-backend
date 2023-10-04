# frozen_string_literal: true

module Users
  # Login/logout controller for users
  class SessionsController < Devise::SessionsController
    respond_to :json

    private

    def respond_with(current_user, _opts = {})
      response.set_header('expires', 1.day.from_now.to_s)
      render json: {
        status: { code: 200, message: 'Logged in sucessfully.' },
        data: UserSerializer.new(current_user).serializable_hash.dig(:data, :attributes)
      }, status: :ok
    end

    def respond_to_on_destroy
      if current_user_to_destroy
        return render json: {
          status: 200,
          message: 'Logged out successfully.'
        }, status: :ok
      end

      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end

    def current_user_to_destroy
      return @current_user_to_destroy if @current_user_to_destroy

      @current_user_to_destroy = if request.headers['Authorization'].present?
                                   jwt_payload = JWT.decode(request.headers['Authorization'].split.last,
                                                            Rails.application.credentials.devise_jwt_secret_key!).first
                                   User.find(jwt_payload['sub'])
                                 end
    end
  end
end
