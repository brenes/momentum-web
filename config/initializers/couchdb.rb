# We load the RAILS_ENV config for couchdb
Rails.logger.info "loading #{Rails.env} couchdb config"
COUCHDB_CONFIG = YAML.load_file("#{Rails.root}/config/couchdb.yml")[Rails.env]
