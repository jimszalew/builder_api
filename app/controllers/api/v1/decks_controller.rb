class Api::V1::DecksController < ApplicationController
  def index
    @decks = Deck.all
    render json: @decks
  end

  def show
    @deck = Deck.find(params[:id])
    render json: @deck
  end

  def create
    @deck = Deck.create!(deck_params)
    render json: @deck, status: :created
  end

  def update

  end

  def destroy

  end

  private

      def deck_params
        params.permit(:color_id, :budget, :max_per_card)
      end
end
