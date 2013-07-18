class SearchController < ApplicationController
  def search
    @tours = Tour.search(params)
    @month_country = Country.where(month_country: true).first
  end
end
