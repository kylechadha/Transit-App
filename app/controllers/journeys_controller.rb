class JourneysController < ApplicationController
  def index
    @journeys = Journey.all
  end

  def show
  end

  def new
  end

  def create
    # Journey begins with click of the route direction
    @journey = Journey.new
    binding.pry
    @journey.name = @trip.headsign

    @journey.origin = [params[:lat], params[:lon]]
    
    @journey.first_lat = params[:lat]
    @journey.first_lon = params[:lon]
    @journey.start_trip_id = @trip

    @journey.start_stop_id =@starting_stop.stop_id
    @journey.start_stop_sequence = @starting_seq.sequence
    @journey.start_stop = @starting_stop.name
    
    @journey.save

    redirect_to 'alert_new_path'

  end
end
