# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Roots' do
  describe 'GET /index' do
    it 'returns a JSON response with the text "Hello"', :aggregate_failures do
      get root_path
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      parsed_response = response.parsed_body
      expect(parsed_response).to eq({ 'text' => 'Hello' })
    end
  end
end
