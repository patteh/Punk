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
end