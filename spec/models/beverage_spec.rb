require "rails_helper"

describe Beverage do
  describe '#sought_beer' do
    context 'when id is blank' do
      it 'returns nil' do
        params = { id: '' }

        expect(described_class.new(params: params).sought_beer).to be_nil
      end
    end

    context 'when id is present' do
      it 'returns nil if the API returns an error code 400' do
        params = { id: 0 }

        expect(described_class.new(params: params).sought_beer).to be_nil
      end

      it 'returns nil if the API returns an error code 404' do
        params = { id: 9999 }

        expect(described_class.new(params: params).sought_beer).to be_nil
      end

      it 'returns a hash of the beer if the API returns a 200' do
        params = { id: 1 }

        beer = described_class.new(params: params).sought_beer

        expect(beer).to be_a Hash
        expect(beer['name']).to eq 'Buzz'
      end
    end
  end

  describe '#sought_beers' do
    context 'when query is blank' do
      it 'returns nil' do
        params = { query: '' }

        expect(described_class.new(params: params).sought_beers).to be_nil
      end
    end

    context 'when query is present' do
      it 'returns nil if the API returns an empty array' do
        params = { query: 'dopefish_lives' }

        expect(described_class.new(params: params).sought_beers).to be_nil
      end

      it 'returns an array of hashes of the beers if it gets a match' do
        params = { query: 'stout'}

        beers = described_class.new(params: params).sought_beers

        expect(beers).to be_an Array
        expect(beers.size).to eq 10
        expect(beers.first['name']).to eq 'Misspent Youth'
      end
    end
  end
end