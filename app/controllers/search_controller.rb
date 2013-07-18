class SearchController < ApplicationController
  def search
    @tours = Tour.search(params)
    @month_country = Month.where(:activate => true).order(:created_at).last
  end
end
