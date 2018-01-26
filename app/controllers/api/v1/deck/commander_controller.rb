class Api::V1::Deck::CommanderController < ApplicationController
  def index
    @deck = Deck.find(params[:id])
    @commanders = Card.where(color_id: @deck.color_id)
  end
end
