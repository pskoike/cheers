class PlacesApi

  def initialize(hangout)
    # @lat = lat
    # @lng = lng
    @hg = hangout
  end

  def fetch_places
    # URl to explore by Section
    url = "https://api.foursquare.com/v2/venues/explore?ll=#{@hg.latitude},#{@hg.longitude}&radius=2000&section=#{@hg.category}&client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}&v=20170101"
    url.gsub!('"')
    venues_from_category = RestClient.get url
    # list of venues from each category
    venues = JSON.parse(venues_from_category)
    # venues["response"]["venues"].map do | v |
    venues["response"]["groups"][0]['items'].map do | v |
       v['venue']["id"]
    end
  end

  def find_places(ids)
    results = ids.map do |id|
      p = Place.find_by(fsq_id: id)
      if !p
        # url ="https://api.foursquare.com/v2/venues/#{id}?v=20170401&oauth_token=TO4OQUXI30PHNRCY1LBG2AG2FVESICUW4OE1RZ4S350DPRO5"
        url ="https://api.foursquare.com/v2/venues/#{id}?v=20170401&&client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}"
        url.gsub!('"')
        response_venue = RestClient.get url
        response_venue = JSON.parse(response_venue)
        venue_hash = response_venue['response']['venue']
        venue = Place.create(
          name: venue_hash['name'],
          address: "#{venue_hash['location']['address']}, #{venue_hash['location']['city']}, #{venue_hash['location']['state']} ",
          longitude:venue_hash['location']['lat'],
          latitude:venue_hash['location']['lng'],
          category: @hg.category,
          rating: venue_hash['rating'],
          fsq_id: venue_hash['id'],
          fsq_url: venue_hash['canonicalUrl'],
          fsq_cat_id: venue_hash['categories'][0]['id'],
          # photo_url: venue_details['response']['venue']['photos']['groups'][0]['items'][0]['prefix'] + "200x200" + venue_details['response']['venue']['photos']['groups'][0]['items'][0]['suffix'] ,
        )
      else
        p
      end
    end
    results.sort! {|x,y| y.rating <=> x.rating }
    r = results.take(15).sample(5) #Take the first 15 and sample.
    r.each do |result|
      po = PlaceOption.new
      po.hangout = @hg
      po.place =  result
      po.save
    end
  end
end
