# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Games' do
  describe 'GET /' do
    let(:user) { create(:user) }
    let(:game) { create(:game) }
    let(:response_games) { response.parsed_body }
    let(:response_game) { response_games.first }

    before do
      game
      get games_path, headers: auth_headers
    end

    it 'responses with game list', :aggregate_failures do
      expect(response).to have_http_status(:ok)
      expect(response_game['name']).to eq(game.name)
      expect(response_game['publisher']).to eq(game.publisher.name)
    end

    context 'without authentication' do
      let(:auth_headers) { headers_without_authorization }

      it { expect(response).to have_http_status(:unauthorized) }
    end
  end
end
