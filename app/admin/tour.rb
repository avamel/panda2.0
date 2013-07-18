ActiveAdmin.register Tour do
  menu label: "Туры"

  filter :title, as: :string, label: "Название тура"
  filter :tour_dates_date, as: :date_range, label: "Даты тура"
  filter :price, as: :numeric, label: "Цена тура"
  filter :special_price, as: :numeric, label: "Специальная цена"
  filter :countries_id, as: :check_boxes,
         collection: proc { Tour.select('countries.id as id, countries.title as title').joins(:countries).group('countries.id').map { |x| [x.title, x.id] } },
         label: "Страны"

  show :title => "Описание тура" do

    panel "Информация о туре" do
      attributes_table_for tour do
        row "Название тура" do
          tour.title
        end
        row "Страны" do
          tour.countries.map(&:title).join(", ")
        end

        row "Превью тура" do
          raw tour.preview
        end
        row "Описание тура" do
          raw tour.overview
        end
        row "Цена" do
          "#{tour.price}" + " #{tour.currency.title}"
        end
        row "Специальная цена" do
          "#{tour.special_price}" + " #{tour.currency.title}" if tour.special_price.present?
        end
        row "Дата тура" do
          tour.tour_dates.map { |x| status_tag(x.date.strftime("%B %e, %Y")) }.join(" ")
        end
      end
    end

    panel "Программа тура" do
      attributes_table_for tour.days do
        tour.days.each do |f|
          row "День #{f.number}" do
            raw f.overview
          end
        end
      end
    end
  end

  index title: "Туры" do
    column :id
    column "Популярность тура", :clicks
    column "Название тура", :title do |tour|
      link_to tour.title, admin_tour_path(tour)
    end
    column("Страны") { |tour| raw tour.countries.map { |x| link_to x.title, admin_country_path(x.id) }.join(', ') }
    column "Цена" do |tour|
      "#{tour.price}" + "#{tour.currency.title}"
    end
    column "Специальная цена" do |tour|
      "#{tour.special_price}" + "#{tour.currency.title}" if tour.special_price.present?
    end
    default_actions
  end

  form do |f|
    f.inputs do

      f.input :title, label: "Название тура"
      f.input :preview, as: :html, label: "Превью для тура"
      f.input :overview, as: :html, label: "Описание тура"
      f.input :currency, label: "Валюта"
      f.input :price, label: "Цена тура"
      f.input :special_price, label: "Специальная цена тура"
      f.input :special_price_comment, label: "Комментарии к специальной цене"
      f.input :country_ids, as: :check_boxes, :collection => Hash[Country.all.map { |b| [b.title, b.id] }], label: "Страны"

      f.has_many :tour_dates do |fu|
        if fu.object.date.present?
          fu.input :date, label: "Дата"
          fu.input :_destroy, as: :boolean, required: false, label: "Удалить"
        else
          fu.input :date, label: "Дата"
        end
      end
      f.input :teaser, label: "Файл для превью"
      f.has_many :galleries do |g|
        g.input :title, label: "Заголовок"
        if g.object.source.present?
          g.input :source, hint: f.template.image_tag(g.object.source.url(:slider_thumb)), label: "Файл"
          g.input :_destroy, as: :boolean, label: "Удалить"
        else
          g.input :source, label: "Файл"
        end
      end
      f.has_many :days do |d|
        if d.object.overview.present?
          d.input :number, label: "Номер дня"
          d.input :overview, as: :html, label: "Программа дня"
          d.input :_destroy, as: :boolean, label: "Удалить"
        else
          d.input :number, label: "Номер дня"
          d.input :overview, as: :html, label: "Программа дня"
        end
      end
      f.buttons
    end
  end

  controller do
    def resource_params
      return [] if request.get?
      [params.require(:tour).permit(:teaser, :title, :preview, :overview, :price, :special_price, :special_price_comment, :currency_id,
                                    tour_dates_attributes: [:id, :date, :_destroy], :country_ids => [],
                                    galleries_attributes: [:id, :title, :_destroy, :source, :source_file_name,
                                                           :source_content_type, :source_file_size, :source_updated_at],
                                    days_attributes: [:id, :overview, :number, :_destroy])]
    end

    def scoped_collection
      super.uniq
    end
  end
end
