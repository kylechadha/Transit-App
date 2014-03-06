class JourneysController < ApplicationController

  def selection
    @stops = Stop.all
    @nearby = Stop.by_distance(origin: [params[:lat], params[:lon]]).limit(16)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destination
    @route = Route.find(params[:id])
    @direction = params[:direction]
    route = "Route #{@route.short_name}: #{@route.long_name}"
    headsign = @direction == "0" ? @route.inbound : @route.outbound

    # Find all the trips that are on the selected route, and in the selected direction
    trips = @route.trips.where(direction_id: params[:direction])

    ## Put all Trip related calculations in the Trip model ##
    # Store the count of stops (via stop_times) in hash with each trip
    trips_hash = {}
    trips.each do |trip|
      trips_hash[trip] = trip.stop_times.count
    end

    # Identify which trips have the most number of stops (and store it in an array since there are multiple)
    longest_trip = trips_hash.select{|k, v| v == trips_hash.values.max }

    # Select a random trip in the longest_trip array and store as @trip
    @trip = longest_trip.keys.sample

    # Calcs to determine which stops to display based on route, direction, and current location
    @starting_stop = Stop.by_distance(origin: [params[:lat], params[:lon]]).joins(:trips).where(trips: { id: @trip.id }).first

    # From the starting stop, we'll figure out what the remaining sequence of stops is
    starting_seq = StopTime.where(trip_id: @trip.id, stop_id: @starting_stop.id).first

    @remaining_stops = StopTime.where(trip_id: @trip.id).where("sequence >= ?", starting_seq.sequence).order('sequence ASC')

    # Save the journey
    @journey = Journey.new(name: route, direction: headsign, start_lat: journey_params[:lat], start_lon: journey_params[:lon], trip_id: @trip.id)
    @journey.save
  end
  
  def preferences
    @journey = Journey.find(params[:id])
    end_stop = Stop.find(params[:stop]).id
    end_lat = Stop.find(params[:stop]).lat
    end_lon = Stop.find(params[:stop]).lon
    @journey.update(stop_id: end_stop, end_lat: end_lat, end_lon: end_lon)
  end

  def mapview
  end

  private
  def journey_params
    params.permit(:id, :direction, :lat, :lon)
  end

end
