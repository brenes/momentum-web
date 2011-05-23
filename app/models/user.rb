class User < CouchRest::Model::Base

  use_database CouchRest.new("http://#{COUCHDB_CONFIG["host"]}:#{COUCHDB_CONFIG["port"]}").database("users")

  property :nick
  property :velocity
  property :reports, Hash
  property :profile, Hash

  def self.find_by_username username
    User.find("u_#{username}")
  end

  def profile_image_url
    self.profile.blank? ? "http://a1.twimg.com/sticky/default_profile_images/default_profile_2_reasonably_small.png" : self.profile["profile_image_url"]
  end
end
