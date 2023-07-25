class BeveragesController < ApplicationController
  def index
    @sought_beers = Beverage.new(params: permitted_params).sought_beers
  end

  def show
    @beer = Beverage.new(params: permitted_params).sought_beer
  end

  def permitted_params
    params.permit(:id, :query)
  end
end
