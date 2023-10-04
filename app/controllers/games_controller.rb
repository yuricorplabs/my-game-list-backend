# frozen_string_literal: true

# Controller for games api
class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    games = Game.includes(:publisher).all
    render json: serialize_collection(GameSerializer, games)
  end

  def search
    games = Searchable.search('Game', params[:term]).map(&:searchable_resource)

    render json: serialize_collection(GameSearchSerializer, games)
  end
end
