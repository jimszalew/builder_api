class Api::V1::CardSearchController < ApplicationController
  def index
    render json: CardSearch.cards_by_color(params['colors'])
  end
end
