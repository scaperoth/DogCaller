class HomeController < ApplicationController
  def index
  	Keen.delete(:signups)
  end
end
