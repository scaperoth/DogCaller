class HomeController < ApplicationController
  def index
  	Keen.publish(:sign_ups, { :username => "lloyd", :referred_by => "harry" })
  end
end
