class ToursController < ApplicationController
  before_filter :count_clicks, only: :show
  before_filter :store_history, only: :show
  def index
    @month_country = Country.where(month_country: true).first
    @tours = Tour.includes(:days)
    @news = News.last(5)
  end

  def show
    @newest_tours = Tour.take(3)
    @slider_counter = -1
    @tour_galleries = @tour.galleries.take(6)
    @tour_days = @tour.days
    @tour_countries = @tour.countries
    @tour_dates = @tour.tour_dates.actual_dates
    @tours_history = Tour.find session[:history]
  end

  def visas
    @tour = Tour.find params[:id]
    @visas = @tour.visas
    @month_country = Country.where(month_country: true).first
    @news_sidebar = News.last(5)
    @newest_tours = Tour.take(3)
    @month_country = Country.where(month_country: true).first
  end

  private
    def person_params
      params.require(:tour).permit!
    end

    def count_clicks
      @tour = Tour.includes(:galleries, :days, :countries).find(params[:id])
      Tour.increment_counter(:clicks, @tour.id)
    end

    def store_history
      tour_id = @tour.id
      session[:history] ||= []
      session[:history].delete_at(0) if session[:history].size >= 5
      session[:history].push tour_id
      session[:history].uniq!
    end
end
