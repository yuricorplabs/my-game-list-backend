# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Games' do
  let(:user) { create(:user) }
  let(:response_game) { response.parsed_body.first }

  describe 'GET /' do
    let(:game) { create(:game) }

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

  describe 'GET /search/:term' do
    let(:games) { create_list(:game, 20) }
    let(:search_term) { games.first.name[1..3] }

    before do
      get search_games_path(term: search_term), headers: auth_headers
    end

    it 'responses with game search list', :aggregate_failures do
      expect(response).to have_http_status(:ok)
      expect(response_game['name']).to eq(games.first.name)
    end

    context 'without authentication' do
      let(:auth_headers) { headers_without_authorization }

      it { expect(response).to have_http_status(:unauthorized) }
    end
  end
end
