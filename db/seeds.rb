# Agency.delete_all
# open("db/agency.txt") do |file|
#   file.read.each_line do |data|
#     gtfs_agency_id, name, url, timezone, lang, phone, fare_url = data.chomp.split(",")
#     Agency.create!(gtfs_agency_id: gtfs_agency_id, name: name, url: url, timezone: timezone, lang: lang, phone: phone, fare_url: fare_url)
#   end
# end

Agency.delete_all
open("db/agency.txt") do |file|
  file.read.each_line do |data|
    gtfs_agency_id, name, url, timezone, lang, phone, fare_url = data.chomp.split(",")
    Agency.create!(gtfs_agency_id: gtfs_agency_id, name: name, url: url, timezone: timezone, lang: lang, phone: phone, fare_url: fare_url)
  end
end

