class HomeController < ApplicationController
  def index

    @interval_options = ["minutely", "hourly","daily","weekly","monthly","yearly"]

    @bark_display_interval = "minutely"

    @start_time = ''
    @end_time = ''


    if params[:bark_interval].present?
      raw_start = DateTime.parse(params[:start_time])
      raw_end = DateTime.parse(params[:end_time])

      @start_time = raw_start.strftime('%Y-%m-%dT%H:%M:%S.000TZ')
      @end_time = raw_end.strftime('%Y-%m-%dT%H:%M:%S.000TZ')

      @bark_display_interval = params[:bark_interval]
    end

    @timeframe = get_timeframe(@bark_display_interval)

    if(!@start_time.blank? || !@end_time.blank? )
      @timeframe = "{
				\"start\" : \"#{@start_time}\",
				\"end\" : \"#{@end_time}\",
			}"
    end
  end

  private

  def get_timeframe(interval)
    case interval
    when "minutely"
      @timeframe = '"today"'
    when "hourly"
      @timeframe = '"today"'
    when "daily"
      @timeframe = '"this_week"'
    when "weekly"
      @timeframe = '"this_month"'
    when "monthly"
      @timeframe = '"this_year"'
    when "yearly"
      @timeframe = '"this_3_years"'
    else
      @timeframe = '"daily"'
    end
    return @timeframe
  end
  #Keen.publish(:BrodyBark, { :bark => rand(100)})



end
