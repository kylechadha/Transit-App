class AlertsController < ApplicationController
  def index
    @alerts = Alert.all
  end

  def show
  end

  def new
  end

  def create
    
    @alert = Alert.new
    
    @alert.stop_id = 
    @alert.end_stop_lat = @
    @alert.end_stop_lon =  
    
    @alert.save

    redirect_to 'alert_new_path'

  end
end