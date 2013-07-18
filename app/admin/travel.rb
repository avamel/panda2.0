ActiveAdmin.register Travel do
  menu label: "Путешествия"

  index do
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :published, as: :boolean
      f.input :preview
      f.input :overview
      f.input :teaser
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
