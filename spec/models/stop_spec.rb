require 'spec_helper'

describe Stop do
  before :each do
    @valid_attributes = {
      gtfs_stop_id: '1',
      code: 'WNDMNSEN',
      name: 'Windward Eb & Main Ns',
      desc: '100 Windward Ave & Main St',
      lat: 33.9879239,
      lon: -118.4717181
    }
  end

  #Test for lat and lon presence
  describe 'validations' do
    context 'If lat is not present' do
      it 'Stop is not valid' do
        stop = Stop.new(@valid_attributes.merge(lat: ''))
        expect(stop.valid?).to eq false
      end
    end
    context 'If lon is not present' do
      it 'Stop is not valid' do
        stop = Stop.new(@valid_attributes.merge(lon: ''))
        expect(stop.valid?).to eq false
      end
    end
    
    #Test for lat and lon numericality
    context 'If lat is not numeric' do
      it 'Stop is not valid' do
        stop = Stop.new(@valid_attributes.merge(lat: 'test'))
        expect(stop.valid?).to eq false
      end
    end
    # context 'If lon is not numeric' do
    #   it 'Stop is not valid' do
    #     stop = Stop.new(@valid_attributes.merge(lon: 'test'))
    #     expect(stop.valid?).to eq false
    #   end
    # end


  end
end
