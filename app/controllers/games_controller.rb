# frozen_string_literal: true

# Controller for games api
class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: Game.all
  end
end
