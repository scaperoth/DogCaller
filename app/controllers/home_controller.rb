class HomeController < ApplicationController
  def index
  		Keen.publish(:BrodyBark, { :bark => rand(100)})
  end
end
