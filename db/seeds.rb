# Agency.delete_all
# open("db/agency.txt") do |file|
#   file.read.each_line do |data|
#     gtfs_agency_id, name, url, timezone, lang, phone, fare_url = data.chomp.split(",")
    # Agency.create!(gtfs_agency_id: gtfs_agency_id, name: name, url: url, timezone: timezone, lang: lang, phone: phone, fare_url: fare_url)
#   end
# end

# Route.delete_all
# open("db/routes.txt") do |file|
#   file.read.each_line do |data|
#     gtfs_route_id, gtfs_agency_id, short_name, long_name, route_type, url, color, text_color = data.chomp.split(",")
#     Route.create!(gtfs_route_id: gtfs_route_id, gtfs_agency_id: gtfs_agency_id, short_name: short_name, long_name: long_name, route_type: route_type, url: url, color: color, text_color: text_color)
#   end
# end

# Created shape ID as " " since there was an extra space in the file! >.<
Trip.delete_all
open("db/trips.txt") do |file|
  file.read.each_line do |data|
    gtfs_route_id, gtfs_service_id, gtfs_trip_id, headsign, direction_id, block_id, shape_id = data.chomp.split(",")
    Trip.create!(gtfs_route_id: gtfs_route_id, gtfs_service_id: gtfs_service_id, gtfs_trip_id: gtfs_trip_id, headsign: headsign, direction_id: direction_id, block_id: block_id, shape_id: shape_id)
  end
end

