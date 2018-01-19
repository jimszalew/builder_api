class Api::V1::CardSearchController < ApplicationController
  def index
    render json: CardSearch.cards_by_color_identity(params['colors'])
  end
end
