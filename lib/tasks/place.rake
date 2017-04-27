require "json"
require "rest-client"

namespace :place do
  desc "Request FourSquare API the list of places to seed db"
  # rails place:fetch_fsq to run in terminal
  task fetch_fsq: :environment do
    puts 'Connecting to FourSquare API'

    categories_list = RestClient.get "https://api.foursquare.com/v2/venues/categories?oauth_token=TO4OQUXI30PHNRCY1LBG2AG2FVESICUW4OE1RZ4S350DPRO5&v=20161016 "
    categories = JSON.parse(categories_list)
    categories.each do |c|
      p c
    end


    puts 'Content imported'

  end

end
