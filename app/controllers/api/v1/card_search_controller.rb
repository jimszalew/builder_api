class Api::V1::CardSearchController < ApplicationController
  def index
    render json: CardSearch.finder(params)
  end
end
