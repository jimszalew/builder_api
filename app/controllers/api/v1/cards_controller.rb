class Api::V1::CardsController < ApplicationController
  def index
    render json: Card.all
  end

  def show
    render json: Card.find_by(name: params['slug'])
  end
end
