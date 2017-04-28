# require 'json'
# require "rest-client"
CATEGORIES = {
  food: "4d4b7105d754a06374d81259",
  bar: "4bf58dd8d48988d116941735",
  brewery: "50327c8591d4c4b30a586d5d",
  lounge: "4bf58dd8d48988d121941735",
  nightclub: "4bf58dd8d48988d11f941735",
}

namespace :place do
  desc "Request FourSquare API the list of places to seed db"
  # rails place:fetch_fsq to run in terminal
  task fetch_fsq: :environment do
    puts 'Connecting to FourSquare API'

    venues_list = {}
    CATEGORIES.each do |k, v|
      puts "Importing venues from #{k}"
       url ="https://api.foursquare.com/v2/venues/search?v=20161016&near=Sao%20Paulo%2C%20SP&categoryId=#{v}&client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}"
        url.gsub!('"')
        venues_from_k = RestClient.get url.to_s
        # list of venues from each category
        venues_list[k] = []
        venues = JSON.parse(venues_from_k)
        venues["response"]["venues"].map do | v |

          venues_list[k] << v["id"]
        end

    end
    venues_list.each do |k, v|
      puts "#{v.count} venues  form #{k} imported"
      v.each do |n|
        puts n # print a list od venues ID estored in the hash venues_list
      end
    end
  end
end
