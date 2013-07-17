class SearchController < ApplicationController
  def index
    @tours = Tour.search_elastic(params)
  end
end
