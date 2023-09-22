# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users::Registrations' do
  describe 'Post /signup' do
    let(:user_params) { attributes_for(:user) }
    let(:response_data) { response.parsed_body&.dig('data') }

    before do
      post user_registration_path, params: { user: user_params }
    end

    it 'creates user', :aggregate_failures do
      expect(response).to have_http_status(:success)
      expect(response.headers['Authorization']).to match(/^Bearer .*/)
      expect(response_data['name']).to eq(user_params[:name])
    end
  end
end
