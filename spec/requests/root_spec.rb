# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Roots' do
  describe 'GET /index' do
    let(:parsed_response) { response.parsed_body }

    before do
      get root_path
    end

    it 'returns a JSON response with the text "Hello"', :aggregate_failures do
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(parsed_response).to eq({ 'text' => 'Hello' })
    end
  end
end
