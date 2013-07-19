ActiveAdmin.register Travel do
  menu label: "Путешествия"

  config.sort_order = "published_des"

  scope :all, :default => true
  scope :published do |travel|
    travel.where("travels.published IS TRUE")
  end
  scope :unpublished do |travel|
    travel.where("travels.published IS NOT TRUE")
  end

  filter :title, as: :string, label: "Заголовок"

  index title: "Путешествия" do
    column "Опубликован" do |travel|
      status_tag("#{travel.published}") if travel.published.present?
    end
    column "Заголовок" do |travel|
      link_to travel.title, admin_travel_path(travel)
    end
    column "Налиличие картинки" do |travel|
      if travel.teaser.present?
        status_tag("есть")
      end
    end
    default_actions
  end

  show title: "Описание путешествия" do |travel|
      attributes_table do
        row "Заголовок к статье" do
          travel.title
        end

        if travel.published.present?
          row "Опубликовано" do
            status_tag("#{travel.published}")
          end
        end
        row "Краткое описание" do
          raw travel.preview
        end
        row "Статья" do
          raw travel.overview
        end
        if travel.teaser.present?
          row "Картинка" do
            image_tag(travel.teaser.url(:slider_thumb))
          end
        end
      end
  end

  form do |f|
    f.inputs do
      f.input :title, label: "Заголовок к статье"
      f.input :published, as: :boolean, label: "Опубликовано"
      f.input :preview, as: :html, label: "Краткое описание"
      f.input :overview, as: :html, label: "Статья"
      f.input :teaser, label: "Картинка"
    end
    f.buttons
  end

  controller do
    def resource_params
      return [] if request.get?
      [params.require(:travel).permit(:teaser, :title, :preview, :overview, :published)]
    end
  end

end
