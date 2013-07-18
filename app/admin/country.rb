ActiveAdmin.register Country do

  class HtmlInput < Formtastic::Inputs::TextInput
    def to_html
      puts "this is my modified version of TextInput"
      input_wrapping do
        label_html <<
            "<div style='width: 78%; float: left'>".html_safe <<
            builder.text_area(method, input_html_options.merge(:class => 'ckeditor')) <<
            "</div><br style='clear: both'/>".html_safe
      end
    end
  end

  menu label: "Страны"

  filter :region, label: "Регион", as: :check_boxes, collection:  [["Европа","Europe"],["Азия","Asia"],["Южная Америка","South_america"],["Африка","Africa"],["а также","Also"]]
  filter :title, label: "Название страны", as: :check_boxes, collection: proc { Country.all.map{|x| [x.title,x.title]} }


  index do
    column :id
    column "Регион", :region
    column "Страна", sortable: 'title' do |country|
      link_to country.title, admin_country_path(country)
    end
    column "Описание" do |country|
      truncate(strip_tags(country.overview), length: 80 )
    end
    default_actions
  end

  show :title => "Описание страны" do
    attributes_table do
      row "Регион" do
          country.region
      end
      row "Название страны" do
         country.title
      end
      row "Описание страны" do
        raw country.overview
      end
    end
  end

  form do |f|
    f.inputs do
      #f.input :activate, as: :boolean, label: "Страна месяца"
      f.input :region, collection: [["Европа","Europe"],["Азия","Asia"],["Южная Америка","South_america"],["Африка","Africa"],["а также","Also"]], label: "Регион"
      f.input :title, sortable: true, label: "Название страны"
      f.input :overview, :as => :html, label: "Описание страны"
    end
    f.buttons
  end

  controller do
    def resource_params
      return [] if request.get?
      [ params.require(:country).permit(:title, :overview, :region) ]
    end
  end

end
