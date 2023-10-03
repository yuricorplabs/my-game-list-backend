# frozen_string_literal: true

# Controller for games api
class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    games = Game.includes(:publisher).all
    render json: serialize_collection(GameSerializer, games)
  end
end
