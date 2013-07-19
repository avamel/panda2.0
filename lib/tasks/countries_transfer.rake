namespace :countries_transfer do
  desc "transfer all countries from old database"
  task transfer: :environment do

    require "active_record"

    class Manufacturer1 < ActiveRecord::Base
      establish_connection Rails.configuration.database_configuration["old_panda"]
      self.table_name = "tours"
    end

    class Manufacturer2 < ActiveRecord::Base
      establish_connection Rails.configuration.database_configuration["old_panda"]
      self.table_name = "countries"
    end

    class Manufacturer3 < ActiveRecord::Base
      establish_connection Rails.configuration.database_configuration["old_panda"]
      self.table_name = "tour_dates"
    end

    class Manufacturer4 < ActiveRecord::Base
      establish_connection Rails.configuration.database_configuration["old_panda"]
      self.table_name = "tour_in_the_countries"
    end
    class Manufacturer5 < ActiveRecord::Base
      establish_connection Rails.configuration.database_configuration["old_panda"]
      self.table_name = "tour_date_links"
    end
    class Manufacturer6 < ActiveRecord::Base
      establish_connection Rails.configuration.database_configuration["old_panda"]
      self.table_name = "galleries"
    end
    class Manufacturer7 < ActiveRecord::Base
      establish_connection Rails.configuration.database_configuration["old_panda"]
      self.table_name = "cur_moneys"
    end
    class Manufacturer8 < ActiveRecord::Base
      establish_connection Rails.configuration.database_configuration["old_panda"]
      self.table_name = "travels"
    end
    class MonthManufacturer < ActiveRecord::Base
      establish_connection Rails.configuration.database_configuration["old_panda"]
      self.table_name = "months"
    end
    class NewsManufacturer < ActiveRecord::Base
      establish_connection Rails.configuration.database_configuration["old_panda"]
      self.table_name = "news"
    end
    class TypeOfHolidaysManufacturer < ActiveRecord::Base
      establish_connection Rails.configuration.database_configuration["old_panda"]
      self.table_name = "type_of_holidays"
    end
    class TypeOfToursManufacturer < ActiveRecord::Base
      establish_connection Rails.configuration.database_configuration["old_panda"]
      self.table_name = "type_of_tours"
    end
    # Manufacturer1.all.each do |old_tour|
    #   new_tour = Tour.new
    #   new_tour.currency_id = old_tour.cur_money_id
    #   new_tour.id = old_tour.id
    #   new_tour.title = old_tour.title
    #   new_tour.preview = old_tour.preview
    #   new_tour.overview = old_tour.overview
    #   new_tour.slug = old_tour.slug
    #   new_tour.price = old_tour.price
    #   new_tour.created_at = old_tour.created_at
    #   new_tour.updated_at = old_tour.updated_at
    #   new_tour.teaser_file_name = old_tour.teaser_file_name
    #   new_tour.teaser_content_type = old_tour.teaser_content_type
    #   new_tour.teaser_file_size = old_tour.teaser_file_size
    #   new_tour.teaser_updated_at = old_tour.teaser_updated_at
    #   new_tour.publish = old_tour.publish
    #   new_tour.save(validate: false)
    # end
    # Manufacturer2.all.each do |old_country|
    #   new_country = Country.new
    #   new_country.id = old_country.id
    #   new_country.title = old_country.title
    #   new_country.overview = old_country.overview
    #   new_country.created_at = old_country.created_at
    #   new_country.updated_at = old_country.updated_at
    #   new_country.slug = old_country.slug
    #   new_country.save(validate: false)
    # end
    # Manufacturer3.all.each do |old_date|
    #   new_date = TourDate.new
    #   new_date.date = old_date.date_start
    #   new_date.tour_id = old_date.tour_id
    #   new_date.save(validate: false)
    # end
    # Manufacturer4.all.each do |old_country_tour|
    #   new_country_tour = CountryTour.new
    #   new_country_tour.id = old_country_tour.id
    #   new_country_tour.tour_id = old_country_tour.tour_id
    #   new_country_tour.country_id = old_country_tour.country_id
    #   new_country_tour.save(validate: false)
    # end
    # Manufacturer5.all.each do |old_date_link|
    #   new_date_link = TourDateLink.new
    #   new_date_link.id = old_date_link.id
    #   new_date_link.tour_id = old_date_link.tour_id
    #   new_date_link.tour_date_id = old_date_link.tour_date_id
    #   new_date_link.save(validate: false)
    # end
    # Manufacturer6.all.each do |old_gallery|
    #   new_gallery = Gallery.new
    #   new_gallery.id = old_gallery.id
    #   new_gallery.tour_id = old_gallery.tour_id
    #   new_gallery.title = old_gallery.title
    #   new_gallery.source_file_name = old_gallery.source_file_name
    #   new_gallery.source_content_type = old_gallery.source_content_type
    #   new_gallery.source_file_size = old_gallery.source_file_size
    #   new_gallery.source_updated_at = old_gallery.source_updated_at
    #   new_gallery.created_at = old_gallery.created_at
    #   new_gallery.updated_at = old_gallery.updated_at
    #   new_gallery.save(validate: false)
    # end
    # Manufacturer7.all.each do |old_cur|
    #   new_cur = Currency.new
    #   new_cur.id = old_cur.id
    #   new_cur.title = old_cur.title
    #   new_cur.save(validate: false)
    # end
    # Manufacturer8.all.each do |old_travel|
    #   new_travel = Travel.new
    #   new_travel.id = old_travel.id
    #   new_travel.title = old_travel.title
    #   new_travel.preview = old_travel.preview
    #   new_travel.overview = old_travel.overview
    #   new_travel.slug = old_travel.slug
    #   new_travel.created_at = old_travel.created_at
    #   new_travel.updated_at = old_travel.updated_at
    #   new_travel.teaser_file_name = old_travel.teaser_file_name
    #   new_travel.teaser_content_type = old_travel.teaser_content_type
    #   new_travel.teaser_file_size = old_travel.teaser_file_size
    #   new_travel.teaser_updated_at = old_travel.teaser_updated_at
    #   new_travel.save(validate: false)
    # end
    # MonthManufacturer.all.each do |old_month|
    #   country = Country.find(old_month.country_id)
    #   country.month_country = true
    #   country.month_preview = old_month.preview
      # country.teaser_file_name = old_month.teaser_file_name
      # country.teaser_content_type = old_month.teaser_content_type
      # country.teaser_file_size = old_month.teaser_file_size
      # country.teaser_updated_at = old_month.teaser_updated_at

    #   country.save(validate: false)
    # end
    # NewsManufacturer.all.each do |old_news|
    #   new_news = News.new
    #   new_news.id = old_news.id
    #   new_news.title = old_news.title
    #   new_news.slug = old_news.slug
    #   new_news.created_at = old_news.created_at
    #   new_news.updated_at = old_news.updated_at
    #   new_news.content = old_news.content
    #   new_news.save(validate: false)
    # end
    TypeOfHolidaysManufacturer.all.each do |old_holiday|
      new_holiday = TypeOfHoliday.new
      new_holiday.id = old_holiday.id
      new_holiday.title = old_holiday.title
      new_holiday.slug = old_holiday.slug
      new_holiday.created_at = old_holiday.created_at
      new_holiday.updated_at = old_holiday.updated_at
      new_holiday.save(validate: false)
    end
    TypeOfToursManufacturer.all.each do |old_type|
      new_type = TypeOfTour.new
      new_type.id = old_type.id
      new_type.type_of_holiday_id = old_type.type_of_holiday_id
      new_type.tour_id = old_type.tour_id
      new_type.save(validate: false)
    end
  end


  task regions: :environment do

    require "active_record"
    europe = ["Чехия", "Швейцария", "Австрия", "Беларусь", "Бельгия", "Болгария", "Великобритания", "Венгрия", "Германия", "Греция", "Дания", "Испания", "Италия", "Кипр", "Латвия", "Литва", "Нидерланды", "Норвегия", "Португалия", "Польша", "Россия", "Словения ", "Украина", "Финляндия", "Франция", "Хорватия ", "Черногория", "Швеция", "Эстония"]
    asia = ["Индия", "Индонезия", "Китай", "ОАЭ", "Таиланд", "Турция"]
    africa = ["Египет", "Тунис"]
    south_america = ["Куба", "Мексика"]
    also = ["Мальдивы", "Доминикана"]
    Country.all.each do |country|
      if europe.include?(country.title)
        country.region = "Europe"
      elsif asia.include?(country.title)
        country.region = "Asia"
      elsif africa.include?(country.title)
        country.region = "Africa"
      elsif south_america.include?(country.title)
        country.region = "South_america"
      else
        country.region = "Also"
      end
      country.save(validate: false)
    end
  end
end