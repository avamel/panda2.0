class ToursController < ApplicationController
  def index
    @tours = Tour.all
  end

  def show
    @tour = Tour.find params[:id]
    @slider_counter = -1
  end

  private
    def person_params
      params.require(:tour).permit!
    end
end
