require 'spec_helper'

describe Journey do
  before :each do
    @valid_attributes = {
      name: "Commute"
    }
  end

#Test for presence and uniqueness on name
describe 'validations' do
    context 'If name is not present' do
      it 'Journey is not valid' do
        journey = Journey.new(@valid_attributes.merge(name: ''))
        expect(journey.valid?).to eq false
      end
    end

      context 'If name is not unique' do
      it 'Journey is not valid' do
        journey1 = Journey.create(@valid_attributes)
        journey2 = Journey.new(@valid_attributes)
        expect(journey2.valid?).to eq false
      end
    end
  end
end