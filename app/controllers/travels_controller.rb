class TravelsController < ApplicationController
  def index
    @news = News.last(5)
    @travels = Travel.take(10)
    @newest_tours = Tour.published.take(9).sample(3)
    @month_country = Country.where(month_country: true).first
  end

  def show
    @news = News.last(5)
    @newest_tours = Tour.published.take(9).sample(3)
    @travel = Travel.find params[:id]
    @month_country = Country.where(month_country: true).first
  end
end
