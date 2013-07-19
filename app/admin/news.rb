ActiveAdmin.register News do
  menu label: "Новости"

  filter :title, as: :string, label: "Заголовок"
  filter :content, as: :string, label: "Контент"

  index title: "Новости" do
    column :id
    column "Заголовок", :title
    column "Контент" do |news|
      truncate(strip_tags(news.content), length: 80)
    end
    column "Налиличие картинки" do |news|
      if news.teaser.present?
        status_tag("есть")
      end
    end
    column "Дата создания", :created_at
    column "Дата обнавления", :updated_at
  end

  show :title => "Новость" do
    attributes_table do
      row "Заголовок" do
        news.title
      end
      row "Контент" do
        raw news.content
      end
      if news.teaser.present?
        row "Картинка" do
          image_tag(news.teaser.url(:slider_thumb))
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :title, label: "Заголовок"
      f.input :content, as: :html, label: "Новость"
      if news.teaser.present?
        f.input :teaser, hint: f.template.image_tag(news.teaser.url(:slider_thumb)), label: "Картинка"
      else
        f.input :teaser, label: "Картинка"
      end
    end
    f.buttons
  end

  controller do
    def resource_params
      return [] if request.get?
      [params.require(:news).permit(:title, :content, :teaser)]
    end
  end

end
