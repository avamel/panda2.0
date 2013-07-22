class WeatherController < ApplicationController
  def forecast
    error = 'Что-то пошло не так'
    params[:forecast]= 'Минск, Республика Беларусь' if params[:forecast].nil?
    Barometer.config = {1 => [:wunderground]}
    barometer = Barometer.new(params[:forecast])
    weather = barometer.measure
    temperature = weather.current.temperature.c
    icon = weather.current.icon
    forecast = {}
    forecast['icon'] = icon
    forecast['temp'] = temperature
    render json: forecast
  rescue
    render json: error, status: :unprocessable_entity
  end
end
