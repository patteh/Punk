class BeveragesController < ApplicationController
  def index
    sought_beers = Beverage.new(params: permitted_params).sought_beers
    @beers = sought_beers.paginate(page: params[:page], per_page: 10) if sought_beers.present?
  end

  def show
    @beer = Beverage.new(params: permitted_params).sought_beer
  end

  def permitted_params
    params.permit(:id, :query, :page)
  end
end
