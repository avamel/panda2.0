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
    Manufacturer1.all.each do |old_tour|
      new_tour = Tour.new
      new_tour.id = old_tour.id
      new_tour.title = old_tour.title
      new_tour.overview = old_tour.overview
      new_tour.price = old_tour.price
      new_tour.created_at = old_tour.created_at
      new_tour.updated_at = old_tour.updated_at
      new_tour.save!
    end
    Manufacturer2.all.each do |old_country|
      new_country = Country.new
      new_country.id = old_country.id
      new_country.title = old_country.title
      new_country.overview = old_country.overview
      new_country.slug = old_country.slug
      new_country.save!
    end
    Manufacturer3.all.each do |old_date|
      new_date = TourDate.new
      new_date.date = old_date.date_start
      new_date.tour_id = old_date.tour_id
      new_date.save!
    end
    Manufacturer4.all.each do |old_country_tour|
      new_country_tour = CountryTour.new
      new_country_tour.id = old_country_tour.id
      new_country_tour.tour_id = old_country_tour.tour_id
      new_country_tour.country_id = old_country_tour.country_id
      new_country_tour.save!
    end
    Manufacturer5.all.each do |old_date_link|
      new_date_link = TourDateLink.new
      new_date_link.id = old_date_link.id
      new_date_link.tour_id = old_date_link.tour_id
      new_date_link.tour_date_id = old_date_link.tour_date_id
      new_date_link.save!
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
      country.save!
    end
  end
end