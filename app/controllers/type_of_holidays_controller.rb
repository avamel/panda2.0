class TypeOfHolidaysController < ApplicationController
  before_filter :set_holiday_and_tour_types, only: :show

  def show
  	@month_country = Country.where(month_country: true).first
    @news = News.last(5)
    @newest_tours = Tour.published.take(9).sample(3)
    @type_title = @tp
    tours_ids = Array.new
    @type.each do |tour|
      tours_ids.push tour.tour_id
    end
    @tours = Tour.where(:id => tours_ids)
  end

  private

  def set_holiday_and_tour_types
    @tp = TypeOfHoliday.find(params[:id])
    @type = TypeOfTour.where(:type_of_holiday_id => @tp.id)
    # redirect_to(@tp)
  end
end
