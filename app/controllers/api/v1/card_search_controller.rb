class Api::V1::CardSearchController < ApplicationController
  def index
    # require "pry"; binding.pry
    # render json: CardSearch.cards_by_color(params['colors'])
    render json: CardSearch.finder(params)
  end
end
