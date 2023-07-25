class BeveragesController < ApplicationController
  def index
    @sought_beers = Beverage.new(permitted_params).sought_beers
  end

  def show; end

  def permitted_params
    params.permit(:query)
  end
end
