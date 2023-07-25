class BeveragesController < ApplicationController
  def index
    @beers = Beverage.new(permitted_params).beers
    Rails.logger.debug @beers
    Rails.logger.debug @beers.size
  end

  def show; end

  def permitted_params
    params.permit(:query)
  end
end
