class TravelsController < ApplicationController
  def index
    @travels = Travel.take(11)
    @month_country = Month.where(:activate => true).order(:created_at).last
  end

  def show
  end
end
