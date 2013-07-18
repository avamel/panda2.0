ActiveAdmin.register Travel do
  menu label: "Путешествия"

  config.sort_order = "published_des"

  scope :all, :default => true
  scope :published
  scope :unpublished

  index title: "Путешествия" do
    column :id
    column "Опубликован" do |travel|
      status_tag("#{travel.published}") if travel.published.present?
    end
    column :title
    default_actions
  end

  show :title => "Описание путешествия" do |travel|
    attributes_table do
      row "Заголовок к статье" do
        travel.title
      end
      row "Краткое описание" do
        raw travel.preview
      end
      row "Статья" do
        raw travel.overview
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
