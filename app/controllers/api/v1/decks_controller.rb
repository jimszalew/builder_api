class Api::V1::DecksController < ApplicationController
  def index
    render json: Deck.all
  end

  def show
    render json: Deck.find(params['id'])
  end
end
