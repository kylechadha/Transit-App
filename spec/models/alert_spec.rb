require 'spec_helper'

describe Alert do
  before :each do
    @valid_attributes = {
      alert_distance: 0.5,
      journey_id: 2,
      stop_time_id: 23
    }
  end

#Test for short_name and long_name presence
  describe 'validations' do
    context 'If alert_distance is not present' do
      it 'Alert is not valid' do
        alert = Alert.new(@valid_attributes.merge(alert_distance: ''))
        expect(alert.valid?).to eq false
      end
    end
    context 'If journey_id is not present' do
      it 'Alert is not valid' do
        alert = Alert.new(@valid_attributes.merge(journey_id: ''))
        expect(alert.valid?).to eq false
      end
    end
    context 'If stop_time_id is not present' do
      it 'Alert is not valid' do
        alert = Alert.new(@valid_attributes.merge(stop_time_id: ''))
        expect(alert.valid?).to eq false
      end
    end
  end

  #Test for alert_distance numericality
  context 'If alert_distance is not numeric' do
    it 'alert_distance is not numeric' do
      alert = Alert.new(@valid_attributes.merge(alert_distance: 'test'))
      expect(alert.valid?).to eq false
    end
  end

end
