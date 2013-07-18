class HomeController < ApplicationController
  def index
    @tours = Tour.take(11)
    @travels = Travel.take(11)
    @month_country = Month.where(:activate => true).order(:created_at).last
  end
end
