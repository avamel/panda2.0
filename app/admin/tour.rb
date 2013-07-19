ActiveAdmin.register Tour do
  menu label: "Туры"

  scope :all, default: true
  scope :publish do |tour|
    tour.where("publish IS TRUE")
  end
  scope :not_punlish do |tour|
    tour.where("publish IS NOT TRUE")
  end

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
        row "Тип тура" do
          tour.type_of_holidays.map(&:title).join(", ")
        end
        row "Название тура" do
          tour.title
        end
        row "Страны" do
          tour.countries.map(&:title).join(", ")
        end
        row "Опубликовано" do
          if tour.publish == true
            status_tag("Да")
          else
             status_tag("Нет")
          end
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
        row "Комментарии к специальной цене" do |tour|
          tour.special_price_comment
        end
        row "Дата тура" do
          tour.tour_dates.map { |x| status_tag(x.date.strftime("%B %e, %Y")) }.join(" ")
        end

        if tour.teaser.present?
          row "Картинка для превью" do
            image_tag(tour.teaser.url(:slider_thumb))
          end
        end

        if tour.galleries.present?
          row "Галерея" do
            ul do
              tour.galleries.each do |img|
                li do
                  img.title
                end
                li do
                  image_tag(img.source.url(:slider_thumb))
                end
              end
            end
          end
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
    column "Опубликовано" do |tour|
      if tour.publish == true
        status_tag("Да")
      else
        status_tag("Нет")
      end
    end
    column "Популярность  тура", :clicks
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

  form html: {multipart: true} do |f|
    f.inputs do

      f.input :title, label: "Название тура"
      f.input :publish, as: :boolean, label: "Опубликован"
      f.input :preview, as: :html, label: "Превью для тура"
      f.input :overview, as: :html, label: "Описание тура"
      f.input :currency, label: "Валюта"
      f.input :price, label: "Цена тура"
      f.input :special_price, label: "Специальная цена тура"
      f.input :special_price_comment, label: "Комментарии к специальной цене"
      f.input :type_of_holidays, as: :check_boxes, label: "Тип тура"
      f.input :countries, as: :check_boxes, label: "Страны"

      f.has_many :tour_dates do |fu|
        if fu.object.date.present?
          fu.input :date, label: "Дата"
          fu.input :_destroy, as: :boolean, required: false, label: "Удалить"
        else
          fu.input :date, label: "Дата"
        end
      end
      f.input :teaser, label: "Картинка для превью", hint: f.template.image_tag(f.object.teaser.url(:slider_thumb)), as: :file
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
      [params.require(:tour).permit(:teaser, :publish, :title, :preview, :overview, :price, :special_price, :special_price_comment, :currency_id,
                                    tour_dates_attributes: [:id, :date, :_destroy], :country_ids => [], :type_of_holiday_ids => [],
                                    galleries_attributes: [:id, :title, :_destroy, :source, :source_file_name,
                                                           :source_content_type, :source_file_size, :source_updated_at],
                                    days_attributes: [:id, :overview, :number, :_destroy])]
    end

    def scoped_collection
      super.uniq
    end
  end
end
