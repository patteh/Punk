class Beverage
  PUNK_API_BASE_URL = 'https://api.punkapi.com/v2/'

  def initialize(params)
    @params = params
  end

  def sought_beers
    Faraday.get(sought_beers_url).body
  end

  private

  attr_reader :params

  def sought_beers_url
    "#{PUNK_API_BASE_URL}beers?beer_name=#{query}"
  end

  def query
    params[:query]
  end
end

