class HomeController < ApplicationController

	def index
		@period_report = PeriodReport.last 100	
	end


end

