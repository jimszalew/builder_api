class Api::V1::CardSearchController < ApplicationController
  def index
    @card_search = CardSearch.new(params).finder
    render json: @card_search
  end
end
