class NewsController < ApplicationController

  def index
    @news = News.all
  end

  def show
    @news_item = News.find params[:id]
    @news = News.last(5)
    @newest_tours = Tour.take(3)
    @month_country = Country.where(month_country: true).first
    # @country = Country.includes(tours: [:galleries, :tour_dates]).find params
  end
end
