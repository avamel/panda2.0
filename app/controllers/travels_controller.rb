class TravelsController < ApplicationController
  def index
    @travels = Travel.take(11)
    @month_country = Country.where(month_country: true).first
  end

  def show
  end
end
