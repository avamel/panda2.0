class SearchController < ApplicationController
  def index
    @tours = Tour.search(params)
  end
end
