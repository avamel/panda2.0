ActiveAdmin.register Country do

  menu label: "Страны"

  scope :all, :default => true
  scope :month_country do |country|
    country.where("countries.month_country IS TRUE")
  end
  scope :not_month_country do |country|
    country.where("countries.month_country IS NOT TRUE")
  end

  filter :region, label: "Регион", as: :check_boxes, collection: [["Европа", "Europe"], ["Азия", "Asia"], ["Южная Америка", "South_america"], ["Африка", "Africa"], ["а также", "Also"]]
  filter :title, label: "Название страны", as: :check_boxes, collection: proc { Country.all.map { |x| [x.title, x.title] } }


  index title: "Страны" do
    column "Регион", :region
    column "Страна месяца" do |country|
      status_tag("Да") if country.month_country == true
    end
    column "Страна", sortable: 'title' do |country|
      link_to country.title, admin_country_path(country)
    end
    column "Описание" do |country|
      truncate(strip_tags(country.overview), length: 80)
    end
    column "Налиличие картинки" do |country|
      if country.teaser.present?
        status_tag("есть")
      end
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
      if country.month_country == true
        row "Страна месяца" do
          status_tag("Да")
        end
      end
      row "Описание страны" do
        raw country.overview
      end
      row "Страна месяца, описание" do
        raw country.month_preview
      end
      if country.teaser.present?
        row "Картинка" do
          image_tag(country.teaser.url(:masonry_little))
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :month_country, as: :boolean, label: "Страна месяца"
      f.input :region, collection: [["Европа", "Europe"], ["Азия", "Asia"], ["Южная Америка", "South_america"], ["Африка", "Africa"], ["а также", "Also"]], label: "Регион"
      f.input :title, sortable: true, label: "Название страны"
      f.input :overview, as: :html, label: "Описание страны"
      f.input :month_preview, as: :html, label: "Страна месяца"
      if f.object.teaser.present?
        f.input :teaser, label: "Картинка", hint: f.template.image_tag(f.object.teaser.url(:masonry_little)), as: :file
        f.input :teaser_delete, as: :boolean, label: "Удалить"
      else
        f.input :teaser, label: "Картинка"
      end
    end
    f.buttons
  end

  controller do
    def resource_params
      return [] if request.get?
      [params.require(:country).permit(:title, :overview, :region, :month_country, :teaser, :teaser_delete, :month_preview)]
    end
  end

end
