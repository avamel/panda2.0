class CountriesController < ApplicationController
  def index
    @tours = Tour.order("clicks DESC").includes(:currency).limit(11)
    @travels = Travel.take(11)
    @month_country = Country.where(month_country: true).first
  end

  def show
    @newest_tours = Tour.published.last(9).sample(3)
    @news = News.last(5)
    @month_country = Country.where(month_country: true).first
    @country = Country.includes(tours: [:galleries, :tour_dates]).find(params[:id])
  end
end
