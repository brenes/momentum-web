class Location < CouchRest::Model::Base

  use_database CouchRest.new("http://#{COUCHDB_CONFIG["host"]}:#{COUCHDB_CONFIG["port"]}").database("locations")

  property :name
  property :lat, Float
  property :lon, Float

  def self.locate location
    puts "---> #{location}"
    l = Location.find location.parameterize
    if l.blank?
      coords = Geocoding::get(location)
      unless coords.blank?
        puts coords.first.inspect
        l = Location.create :_id => location.parameterize, :lat => coords.first.latitude, :lon => coords.first.longitude, :name => location
       end
    end
    l
  end

  def latlon
    [lat, lon]
  end

  def lonlat
    [lon, lat]
  end
end
