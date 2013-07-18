class ToursController < ApplicationController
  before_filter [:store_history, :count_clicks], only: :show
  def index
    @month_country = Month.where(:activate => true).order(:created_at).last
    @tours = Tour.all
  end

  def show
    @tour = Tour.find params[:id]
    @slider_counter = -1
    @tour_galleries = @tour.galleries.take(6)
    @tour_days = @tour.days
    @tour_countries = @tour.countries
    @tour_dates = @tour.tour_dates
    @tours_history = Tour.find session[:history]
  end

  private
    def person_params
      params.require(:tour).permit!
    end

    def count_clicks
      Tour.increment_counter(:clicks, @tour.id)
    end

    def store_history
      tour_id = Tour.find(params[:id]).id
      session[:history] ||= []
      session[:history].delete_at(0) if session[:history].size >= 5
      session[:history] << tour_id
      session[:history].uniq!
    end
end
