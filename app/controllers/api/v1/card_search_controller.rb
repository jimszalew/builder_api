class Api::V1::CardSearchController < ApplicationController
  def index
    card_search = CardSearch.new(params)
    render json: card_search.finder
  end
end
