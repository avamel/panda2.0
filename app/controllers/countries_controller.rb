class CountriesController < ApplicationController
  def index
    @tours = Tour.order("clicks DESC").includes(:currency).limit(11)
    @travels = Travel.take(11)
    @month_country = Month.where(:activate => true).order(:created_at).last
  end

  def show
    # @newest_tours = Tour.last(3)
    @newest_tours = Tour.take(3)
    @month_country = Month.where(:activate => true).order(:created_at).last
    @country = Country.includes(tours: [:galleries, :tour_dates]).find(params[:id])
  end
end
