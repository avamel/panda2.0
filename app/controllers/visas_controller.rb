class VisasController < ApplicationController
  def index
    @visas = Visa.all
    @month_country = Country.where(month_country: true).first
    @news_sidebar = News.last(5)
    @newest_tours = Tour.published.take(9).sample(3)
    @month_country = Country.where(month_country: true).first
  end

  def show
    @visa = Visa.find params[:id]
    @news = News.last(5)
    @newest_tours = Tour.published.take(9).sample(3)
    @month_country = Country.where(month_country: true).first
    # @country = Country.includes(tours: [:galleries, :tour_dates]).find params
  end
end
