class StopsController < ApplicationController

  def index
    @stops = Stop.all
  end

  def selection
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

    # Find all the trips that are on the selected route, and in the selected direction
    trips = @route.trips.where(direction_id: params[:direction])

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
    @stop_sequence = Stop.find_by_sql("
      SELECT DISTINCT stops.lat, stops.lon, stops.name, r.short_name, r.long_name, t.direction_id, st.sequence, 
      (ACOS(least(1,COS(0.593639903131675)*COS(-2.0681326200116366)*COS(RADIANS(stops.lat))*COS(RADIANS(stops.lon))+
       COS(0.593639903131675)*SIN(-2.0681326200116366)*COS(RADIANS(stops.lat))*SIN(RADIANS(stops.lon))+
       SIN(0.593639903131675)*SIN(RADIANS(stops.lat))))*3963.19)
      
      FROM stops
      
       INNER JOIN stop_times AS st ON stops.id = st.stop_id
       INNER JOIN trips AS t ON st.trip_id = t.id
       INNER JOIN routes AS r ON t.route_id = r.id
      
      WHERE t.id = 11822
      
       ORDER BY st.sequence
    ")

  end
end
