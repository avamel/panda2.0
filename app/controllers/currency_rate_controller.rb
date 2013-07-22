class CurrencyRateController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  require 'nokogiri_hash'
  require 'net/ping'

  def rate
    url = 'http://www.nbrb.by/Services/XmlExRates.aspx'
    #url = 'http://www.obmennik.by/xml/'
    ping_url = Net::Ping::HTTP.new(url)
    error = 'Извините, курс валюты временно недоступен.'
    if  ping_url.ping?
      xml = Nokogiri::XML(open(url))
      hash = xml.to_hash
      #render :text => hash
      rate = {}
      rate['usd']= hash['DailyExRates'][4]['Currency'][4]['Rate']
      rate['eur']= hash['DailyExRates'][5]['Currency'][4]['Rate']
    end
    if hash.nil?
      render json: error, status: :unprocessable_entity
    else
      render json: rate
    end
  end
end
