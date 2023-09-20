require 'rails_helper'

RSpec.describe "Roots", type: :request do
  describe "GET /index" do
    it 'returns a JSON response with the text "Hello"', :aggregate_failures do
      get root_path
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to eq({ 'text' => 'Hello' })
    end
  end
end
