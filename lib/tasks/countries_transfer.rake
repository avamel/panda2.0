namespace :countries_transfer do
  desc "transfer all countries from old database"
  task transfer: :environment do

    require "active_record"

    class Manufacturer < ActiveRecord::Base
      establish_connection Rails.configuration.database_configuration["old_panda"]
      self.table_name = "countries"
    end

    Manufacturer.all.each do |old_country|
      new_country = Country.new
      new_country.title = old_country.title
      new_country.overview = old_country.overview
      new_country.slug = old_country.slug
      new_country.save!
    end
  end


  task regions: :environment do

    require "active_record"
    array = ["Доминиканы", "Мальдивы"]
    Country.all.each do |country|
      if array.include?(country.title)
        country.region = "Also"
        country.save!
      end
    end
  end
end