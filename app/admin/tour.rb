ActiveAdmin.register Tour do

  form do |f|
    f.inputs do
      f.input :title
      f.input :overview, :as => :html
      f.input :price
      f.input :special_price
      f.input :special_price_comment
      f.input :currency, :as => :select, :collection => ['€', '$', 'BYR', 'RUB']
      f.input :country_ids, :as => :check_boxes, :collection => Hash[Country.all.map { |b| [b.title, b.id] }]
      f.has_many :tour_dates do |fu|
        fu.input :date
        fu.input :_destroy, :as => :boolean, :required => false, :label => "Удалить"
      end


      f.has_many :galleries do |g|
        g.input :title, :label => "Заголовок"
        if g.object.source.present?
          g.input :source, :hint => f.template.image_tag(g.object.source.url(:slider_thumb)), :label => "Файл"
          g.input :_destroy, :as => :boolean, :label => "Удалить"
        else
          g.input :source, :label => "Файл"
        end
      end

      f.has_many :days do |d|
        d.input :overview
        d.input :number
      end

      f.buttons
    end
  end

  controller do
    def resource_params
      return [] if request.get?
      [params.require(:tour).permit(:title, :overview, :price, :special_price, :special_price_comment, :currency,
                                    tour_dates_attributes: [:id, :date, :_destroy], :country_ids => [],
                                    galleries_attributes: [:id, :title, :_destroy, :source, :source_file_name,
                                                           :attachment_content_type, :attachment_file_size, :attachment_updated_at],
                                    days_attributes: [:id, :overview, :number, :_destroy])]
    end
  end
end
