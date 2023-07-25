class Beverage
  PUNK_API_BASE_URL = 'https://api.punkapi.com/v2/'.freeze

  def initialize(params:)
    @params = params
  end

  def sought_beer
    return if id

    JSON.parse(Faraday.get(sought_beer_url).body).first
  end

  def sought_beers
    return if query.blank?

    JSON.parse(Faraday.get(sought_beers_url).body)
  end

  private

  attr_reader :params

  def sought_beer_url
    "#{PUNK_API_BASE_URL}beers/#{id}"
  end

  def sought_beers_url
    "#{PUNK_API_BASE_URL}beers?beer_name=#{query}"
  end

  def query
    params[:query]
  end

  def id
    params[:id]
  end
end

