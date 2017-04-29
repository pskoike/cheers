class PlacesApi
  CATEGORIES = {
    food: "4d4b7105d754a06374d81259",
    bar: "4bf58dd8d48988d116941735",
    brewery: "50327c8591d4c4b30a586d5d",
    lounge: "4bf58dd8d48988d121941735",
    nightclub: "4bf58dd8d48988d11f941735",
  }
  def initialize(lat, lng, hangout)
    @lat = lat
    @lng = lng
    @hangout = hangout
    @categories = CATEGORIES
  end

  def fetch_places
    # category = @categories[@hangout.category.to_sym]
    # p category
    # url = "https://api.foursquare.com/v2/venues/search?oauth_token=TO4OQUXI30PHNRCY1LBG2AG2FVESICUW4OE1RZ4S350DPRO5&v=20170401&ll=#{@lat},#{@lng}&intent=checkin&radius=2000&categoryId=#{category}"
    url = "https://api.foursquare.com/v2/venues/search?v=20170401&ll=#{@lat},#{@lng}&radius=2000&query=#{@hangout.category}&oauth_token=TO4OQUXI30PHNRCY1LBG2AG2FVESICUW4OE1RZ4S350DPRO5"

    # URl to explore by Section
    # url = "https://api.foursquare.com/v2/venues/explore?ll=-23.5593651,-46.6770567&radius=2000&section=food&client_id=NHMKJWILK1SJM00EQ1WNDI5EQS3TYNVUOQFBUARSGDTIVJK1&client_secret=JFZQACYBUYN4TDKJUWB5X45RVV3PRLLBXCPBEEUVZ2MJKLET&v=20170101"


    # "https://api.foursquare.com/v2/venues/search?v=20161016&near=Sao%20Paulo%2C%20SP&categoryId=#{category}&client_id={ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}"
    url.gsub!('"')
    venues_from_category = RestClient.get url
    # list of venues from each category
    venues = JSON.parse(venues_from_category)
    venues["response"]["venues"].map do | v |
       v["id"]
    end
  end

  def find_places(ids)
    ids.map do |id|
      p = Place.find_by(fsq_id: id)
      if !p
        url ="https://api.foursquare.com/v2/venues/#{id}?v=20170401&oauth_token=TO4OQUXI30PHNRCY1LBG2AG2FVESICUW4OE1RZ4S350DPRO5"
        url.gsub!('"')
        response_venue = RestClient.get url
        response_venue = JSON.parse(response_venue)
        venue_hash = response_venue['response']['venue']
        # if @categories.has_value?(venue_hash['categories'][0]['id'])
          venue = Place.create(
          name: venue_hash['name'],
          address: "#{venue_hash['location']['address']}, #{venue_hash['location']['city']}, #{venue_hash['location']['state']} ",
          longitude:venue_hash['location']['lat'],
          latitude:venue_hash['location']['lng'],
          category: @hangout.category,
          rating: venue_hash['rating'],
          fsq_id: venue_hash['id'],
          fsq_url: venue_hash['canonicalUrl'],
          fsq_cat_id: venue_hash['categories'][0]['id'],
          # photo_url: venue_details['response']['venue']['photos']['groups'][0]['items'][0]['prefix'] + "200x200" + venue_details['response']['venue']['photos']['groups'][0]['items'][0]['suffix'] ,
          )

        # end
      else
        p
      end

    end

  end
end
