module Rate
  require 'nokogiri'
  require 'open-uri'
  require 'nokogiri_hash'
  require 'net/ping'

  @queue = :currency

  def self.perform
    url = 'http://www.nbrb.by/Services/XmlExRates.aspx'
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
      puts "ok"
      currency = CurrencyRate.first_or_create
      currency.usd = rate['usd'].to_i
      currency.eur = rate['eur'].to_i
      currency.save!
      puts "ok"
    end
    puts "bad"
  end
end