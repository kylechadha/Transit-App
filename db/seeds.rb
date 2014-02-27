# Hi Friends, REMEMBER: When loading in data from other agencies, must check column names (to ensure the same number of columns)

# Agency.delete_all
# open("db/agency.txt") do |file|
#   file.read.each_line do |data|
#     gtfs_agency_id, name, url, timezone, lang, phone, fare_url = data.chomp.split(",")
#     Agency.create!(gtfs_agency_id: gtfs_agency_id, name: name, url: url, timezone: timezone, lang: lang, phone: phone, fare_url: fare_url)
#   end
# end

# Route.delete_all
# open("db/routes.txt") do |file|
#   file.read.each_line do |data|
#     # When loading in data from other agencies, must check column names (to ensure the same number of columns)
#     gtfs_route_id, gtfs_agency_id, short_name, long_name, route_type, url, color, text_color = data.chomp.split(",")
#     Route.create!(gtfs_route_id: gtfs_route_id, gtfs_agency_id: gtfs_agency_id, short_name: short_name, long_name: long_name, route_type: route_type, url: url, color: color, text_color: text_color)
#   end
# end

# Route.all.each do |route|
#   agency = Agency.find_by(gtfs_agency_id: route.gtfs_agency_id)
#   route.agency_id = agency.id
#   route.save
# end

# # Created shape ID as " " since there was an extra space in the file! >.<
# Trip.delete_all
# open("db/trips.txt") do |file|
#   file.read.each_line do |data|
#     gtfs_route_id, gtfs_service_id, gtfs_trip_id, headsign, direction_id, block_id, shape_id = data.chomp.split(",")
#     Trip.create!(gtfs_route_id: gtfs_route_id, gtfs_service_id: gtfs_service_id, gtfs_trip_id: gtfs_trip_id, headsign: headsign, direction_id: direction_id, block_id: block_id, shape_id: shape_id)
#   end
# end

# Trip.all.each do |trip|
#   route = Route.find_by(gtfs_route_id: trip.gtfs_route_id)
#   trip.route_id = route.id
#   trip.save
# end

# Stop.delete_all
# open("db/stops.txt") do |file|
#   file.read.each_line do |data|
#     gtfs_stop_id, code, name, desc, lat, lon, zone_id, url, location_type, parent_station = data.chomp.split(",")
#     Stop.create!(gtfs_stop_id: gtfs_stop_id, code: code, name: name, desc: desc, lat: lat, lon: lon, zone_id: zone_id, url: url, location_type: location_type, parent_station: parent_station)
#   end
# end

# StopTime.delete_all
# open("db/stop_times.txt") do |file|
#   file.read.each_line do |data|
#     gtfs_trip_id, arrival_time, departure_time, gtfs_stop_id, sequence, headsign, pickup_type, drop_off_type, shape_dist_traveled = data.chomp.split(",")
#     StopTim.ecreate!(gtfs_trip_id: gtfs_trip_id, arrival_time: arrival_time, departure_time: departure_time, gtfs_stop_id: gtfs_stop_id, sequence: sequence, headsign: headsign, pickup_type: pickup_type, drop_off_type: drop_off_type, shape_dist_traveled: shape_dist_traveled)
#   end
# end

# StopTime.all.each do |stoptimes|
#   trip = Trip.find_by(gtfs_trip_id: stoptimes.gtfs_trip_id)
#   stoptimes.trip_id = trip.id

#   stop = Stop.find_by(gtfs_stop_id: stoptimes.gtfs_stop_id)
#   stoptimes.stop_id = stop.id

#   stoptimes.save
# end
