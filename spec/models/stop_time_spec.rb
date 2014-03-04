require 'spec_helper'

describe StopTime do
  before :each do
    @valid_attributes = {
      trip_id: 585476,
      stop_id: 621,
      sequence: 34,
    }
  end

#Test for presence
  describe 'validations' do
    context 'If trip_id is not present' do
      it 'StopTime is not valid' do
        stoptime = StopTime.new(@valid_attributes.merge(trip_id: ''))
        expect(stoptime.valid?).to eq false
      end
    end
    context 'If stop_id is not present' do
      it 'StopTime is not valid' do
        stoptime = StopTime.new(@valid_attributes.merge(stop_id: ''))
        expect(stoptime.valid?).to eq false
      end
    end

    context 'If sequence is not present' do
      it 'StopTime is not valid' do
        stoptime = StopTime.new(@valid_attributes.merge(sequence: ''))
        expect(stoptime.valid?).to eq false
      end
    end
    context 'If sequence is not numeric' do
      it 'StopTime is not valid' do
        stoptime = StopTime.new(@valid_attributes.merge(sequence: 'test'))
        expect(stoptime.valid?).to eq false
      end
    end

  end
end