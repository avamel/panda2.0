class SearchController < ApplicationController
  def search
  	@news = News.last(5)
    @tours = Tour.search(params)
    @month_country = Country.where(month_country: true).first
  end
end
