class HomeController < ApplicationController
  def index
  	@currency = CurrencyRate.last
    @news = News.last(5)
    # @closest_tour = Tour.closest
    @tours = Tour.published.order("clicks DESC").includes(:currency).limit(10)

    @travels = Travel.take(10)
    @month_country = Country.where(month_country: true).first
    @newest_tours = Tour.published.last(9).sample(3)
  end
end
