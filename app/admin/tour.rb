ActiveAdmin.register Tour, :order => :title_asc do
  menu :label => "Туры"
  filter :title, as: :string
  filter :tour_dates_date, as: :date_range, label: "Даты тура"
  filter :price, as: :numeric
  filter :special_price, as: :numeric
  filter :countries_id, as: :check_boxes,
         collection: proc { Tour.select('countries.id as id, countries.title as title').joins(:countries).group('countries.id').map { |x| [x.title, x.id] } }

  show :title => "Описание тура" do
    panel "Информация о туре" do

      attributes_table_for tour do
        row "Название тура" do
          tour.title
        end
        row "Страны" do
          tour.countries.map(&:title).join(", ")
        end
        row "Описание тура" do
          simple_format tour.overview
        end
        row "Цена" do
          tour.price
        end
        row "Специальная цена" do
          tour.special_price
        end
        row "Дата тура" do
          tour.tour_dates.map { |x| status_tag(x.date.strftime("%B %e, %Y")) }.join(" ")
        end
      end
    end

    panel "Программа тура" do
      attributes_table_for tour.days do
        x = 1
        tour.days.each do |f|
          row "День #{x}" do
            simple_format f.overview

          end
          x += 1
        end
      end
    end

  end

  index :title => "Туры" do
    column :id
    column "Название тура", :title do |tour|
      link_to tour.title, admin_tour_path(tour)
    end
    column("Страны") { |tour| raw tour.countries.map { |x| link_to x.title, admin_country_path(x.id) }.join(', ') }
    column "Цена", :price
    column "Специальная цена", :special_price
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :title, label: "Название тура"
      f.input :overview, :as => :html, label: "Описание тура"
      f.input :price, :label => "Цена тура"
      f.input :special_price, label: "Специальная цена тура"
      f.input :country_ids, :as => :check_boxes, :collection => Hash[Country.all.map { |b| [b.title, b.id] }], label: "Страны"
      f.has_many :tour_dates do |fu|
        if fu.object.date.present?
          fu.input :date, label: "Дата"
          fu.input :_destroy, :as => :boolean, :required => false, label: "Удалить"
        else
          fu.input :date, label: "Дата"
        end
      end


      f.has_many :galleries do |g|
        g.input :title, label: "Заголовок"
        if g.object.attachment.present?
          g.input :attachment, :hint => f.template.image_tag(g.object.attachment.url(:thumb)), label: "Файл"
          g.input :_destroy, :as => :boolean, label: "Удалить"
        else
          g.input :attachment, label: "Файл"
        end
      end

      f.has_many :days do |d|
        if d.object.overview.present?
          d.input :overview, :as => :html, label: "Программа дня"
          d.input :_destroy, as: :boolean, label: "Удалить"
        else
          d.input :overview, :as => :html, label: "Программа дня"
        end

      end

      f.buttons
    end
  end

  controller do
    def resource_params
      return [] if request.get?
      [params.require(:tour).permit(:title, :overview, :price, :special_price,
                                    tour_dates_attributes: [:id, :date, :_destroy], :country_ids => [],
                                    galleries_attributes: [:id, :title, :_destroy, :attachment, :attachment_file_name,
                                                           :attachment_content_type, :attachment_file_size, :attachment_updated_at],
                                    days_attributes: [:id, :overview, :_destroy])]
    end

    def scoped_collection
      super.uniq
    end
  end

end
