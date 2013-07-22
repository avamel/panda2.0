desc "currency rate"
task :currency_rate => :environment do
  require 'nokogiri'
  require 'open-uri'
  require 'nokogiri_hash'
  require 'net/ping'
  url = 'http://www.nbrb.by/Services/XmlExRates.aspx'
  #url = 'http://www.obmennik.by/xml/'
  ping_url = Net::Ping::HTTP.new(url)
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
  CurrencyRate.create(usd: rate['usd'], eur: rate['eur'])
end