class Api::V1::DeckSearchController < ApplicationController
  def index
    deck_search = DeckSearch.new(params)
    render json: deck_search.finder
  end
end
