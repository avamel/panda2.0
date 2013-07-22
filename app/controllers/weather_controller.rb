class WeatherController < ApplicationController
  def forecast
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
    render text: "Введите верное название города!"
  end
end
