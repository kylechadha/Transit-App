class StopsController < ApplicationController

  def index
    @stops = Stop.all
    @nearby = Stop.by_distance(:origin => [params[:lat], params[:lon]]).limit(16)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destination
    @route = Route.find(params[:id])
    @direction = params[:direction]
    trips = @route.trips.where(direction_id: params[:direction])

    trips_hash = {}
    trips.each do |trip|
      trips_hash[trip] = trip.stop_times.count
    end
    longest_trip = trips_hash.select{|k, v| v == trips_hash.values.max }
    @trip = longest_trip.keys.sample

  end
end
