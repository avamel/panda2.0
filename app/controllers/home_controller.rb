class HomeController < ApplicationController
  def index
    @tours = Tour.take(11)
  end
end
