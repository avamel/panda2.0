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
      rate = {}
      i = -1
      loop do
        i+=1
        rate['usd']= hash['DailyExRates'][i]['Currency'][4]['Rate']
        break if hash['DailyExRates'][i]['Currency'][1]['CharCode'] == "USD"
      end
      loop do
        i+=1
        rate['eur']= hash['DailyExRates'][i]['Currency'][4]['Rate']
        break if hash['DailyExRates'][i]['Currency'][1]['CharCode'] == "EUR"
      end
    end
    if hash.nil?
      render json: error, status: :unprocessable_entity
    else
      render json: rate
    end
  end
end
