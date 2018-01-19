class Api::V1::CardsController < ApplicationController
  def index
    render json: Card.all
  end

  def show
    render json: Card.friendly.find(params['id'])
  end
end
