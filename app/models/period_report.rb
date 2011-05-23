class PeriodReport < CouchRest::Model::Base

	use_database CouchRest.new("http://#{COUCHDB_CONFIG["host"]}:#{COUCHDB_CONFIG["port"]}").database("period_reports")

	property :time
	property :mentions, Integer, :default => 0
	property :average_followers, Integer, :default => 0
	property :average_acceleration, Integer, :default => 0
	property :average_velocity, Integer, :default => 0
	property :sorted_users, [Hash]

	def self.last limit = 24
		period_report = nil
		hours = 1
		while period_report.blank? and hours <= limit
			period_report= PeriodReport.find hours.hour.ago.strftime("%Y %b %d %H")
			hours += 1
		end
		period_report
	end
end
