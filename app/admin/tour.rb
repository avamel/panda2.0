ActiveAdmin.register Tour do

  form do |f|
    f.inputs do
      f.input :title
      f.input :overview, :as => :html
      f.input :price
      f.input :special_price
      f.input :country_ids, :as => :check_boxes, :collection => Hash[Country.all.map { |b| [b.title, b.id] }]
      f.has_many :tour_dates do |fu|
        fu.input :date
        fu.input :_destroy, :as => :boolean, :required => false, :label => "Delete date"
      end
      f.inputs "Attachment", :multipart => true do
        f.has_many :galleries do |fu|
          fu.input :title
          fu.input :attachment, :as => :file
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
                                    galleries_attributes: [:imageable_type, :imageable_id, :id, :title, :_destroy, :attachment, :attachment_file_name,
                                                           :attachment_content_type, :attachment_file_size, :attachment_updated_at])]
    end
  end

end
