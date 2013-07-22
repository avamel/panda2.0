class HomeController < ApplicationController
  def index
    @news = News.last(5)
    # @closest_tour = Tour.closest
    @tours = Tour.published.order("clicks DESC").includes(:currency).limit(10)

    @travels = Travel.take(11)
    @month_country = Country.where(month_country: true).first
    @newest_tours = Tour.published.last(9).sample(3)
  end
end
