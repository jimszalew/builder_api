class Api::V1::CommandersController < ApplicationController
  def index
    @deck = Deck.find(params[:id])
    info = {
            colors: @deck.color_id,
            types: "Legendary,Creature",
            max_per_card: @deck.max_per_card
          }
    @commanders = CardSearch.new(info).commanders
    render json: @commanders
  end
end
