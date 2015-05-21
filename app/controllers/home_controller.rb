class HomeController < ApplicationController
	def index
		@interval_options = ["minutely", "hourly","daily","weekly","monthly","yearly"]

		@bark_display_interval = "minutely"
		if params[:bark_interval].present?
			@bark_display_interval = params[:bark_interval] 
		end

		@timeframe = get_timeframe(@bark_display_interval)
	end

	private

	def get_timeframe(interval)
		case interval
		when "minutely"
			@timeframe = "today"
		when "hourly"
			@timeframe = "today"
		when "daily"
			@timeframe = "this_week"
		when "weekly"
			@timeframe = "this_month"
		when "monthly"
			@timeframe = "this_year"
		when "yearly"
			@timeframe = "this_3_years"
		else 
			@timeframe = "today "
		end
		return @timeframe
	end
  		#Keen.publish(:BrodyBark, { :bark => rand(100)})



  	end
