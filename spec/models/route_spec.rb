require 'spec_helper'

describe Route do
  before :each do
    @valid_attributes = {
      gtfs_route_id: '1944',
      short_name: '1',
      long_name: 'Santa Monica Blvd - Ucla',
      route_type: '3'
    }
  end

  #Test for short_name and long_name presence
  describe 'validations' do
    context 'If short name is not present' do
      it 'Route is not valid' do
        route = Route.new(@valid_attributes.merge(short_name: ''))
        expect(route.valid?).to eq false
      end
    end
    context 'If long name is not present' do
      it 'Route is not valid' do
        route = Route.new(@valid_attributes.merge(long_name: ''))
        expect(route.valid?).to eq false
      end
    end
  
  end
end