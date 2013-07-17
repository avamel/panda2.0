class CountriesController < ApplicationController
  def index
  end

  def show
    @country = Country.includes(tours: [:galleries, :tour_dates]).find(params[:id])
  end
end
