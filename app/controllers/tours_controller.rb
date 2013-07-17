class ToursController < ApplicationController
  before_filter :store_history, only: :show
  def index
    @tours = Tour.all
  end

  def show
    @tour = Tour.find params[:id]
    @slider_counter = -1
    @tour_galleries = @tour.galleries
    @tour_days = @tour.days
    @tour_countries = @tour.countries
    @tour_dates = @tour.tour_dates
    @tours_history = Tour.find session[:history]
  end

  private
    def person_params
      params.require(:tour).permit!
    end

    def store_history
      tour_id = Tour.find(params[:id]).id
      session[:history] ||= []
      session[:history].delete_at(0) if session[:history].size >= 5
      session[:history] << tour_id
      session[:history].uniq!
    end
end
