class Api::V1::DeckCardsController < ApplicationController
  def destroy
    @deck_card = DeckCard.find(params[:id])
    @deck_card.destroy
  end
end
