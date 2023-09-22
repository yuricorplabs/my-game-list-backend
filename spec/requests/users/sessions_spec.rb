# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users::Sessions' do
  describe 'Post /login' do
    let(:user) { create(:user) }
    let(:user_params) do
      {
        email: user.email,
        password: attributes_for(:user)[:password]
      }
    end

    let(:response_data) { response.parsed_body&.dig('data') }

    before do
      post user_session_path, params: { user: user_params }
    end

    it 'logins user', :aggregate_failures do
      expect(response).to have_http_status(:success)
      expect(response.headers['Authorization']).to match(/^Bearer .*/)
      expect(response_data['name']).to eq(user.name)
    end
  end

  describe 'Delete /logout' do
    let(:user) { create(:user) }

    before do
      delete destroy_user_session_path, headers: auth_headers
    end

    it 'logouts user', :aggregate_failures do
      expect(response).to have_http_status(:success)
      expect(response.headers).not_to include('Authorization')
    end

    context 'without authorization token' do
      let(:auth_headers) { headers_without_authorization }

      it 'responds error' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
