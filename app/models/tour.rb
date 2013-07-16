class Tour < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  has_many :galleries, :as => :imageable, dependent: :destroy
  has_many :days, dependent: :destroy
  has_many :country_tours
  has_many :countries, :through => :country_tours
  has_many :tour_dates, dependent: :destroy
  accepts_nested_attributes_for :tour_dates, :allow_destroy => true
  accepts_nested_attributes_for :galleries, allow_destroy: true

  validates :title, presence: true
  validates :overview, presence: true


  mapping do
    indexes :title
    indexes :overview
    indexes :price, type: 'integer'
    indexes :dates, :as => 'tour_dates.pluck(:date)', type: 'date', :index => :not_analyzed
    indexes :country_name, :as => 'countries.pluck(:title)', :type => :string, :index => :not_analyzed
  end

  def self.search_elastic(params)
    tire.search(page: params[:page], per_page: 1000, load: true) do
      query do
        boolean do
          should { string params[:search], default_operator: "OR" } if params[:search].present?
          must { terms :country_name, params[:country_name] } if params[:country_name].present?
          must { range :dates, from: params[:start], to: (Date.today+10.years).to_date } if params[:start].present?
          must { range :price, from: params[:min].to_i, to: params[:max].to_i } if params[:min].present? && params[:max].present?
        end
      end
      sort { by :price, "asc" }
    end
  end
end
