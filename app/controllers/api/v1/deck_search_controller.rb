class Api::V1::DeckSearchController < ApplicationController
  def index
    @deck_search = DeckSearch.new(params).finder
    render json: @deck_search
  end
end
