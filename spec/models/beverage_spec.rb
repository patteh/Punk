require "rails_helper"

describe Beverage do
  describe '#sought_beer' do
    context 'when id is blank' do
      it 'returns nil' do
        params = { id: '' }

        expect(described_class.new(params: params).sought_beer).to be_nil
      end
    end
  end
end