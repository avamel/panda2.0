class SearchController < ApplicationController
  def search
    @tours = Tour.search(params)
  end
end
