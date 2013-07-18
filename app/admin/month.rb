ActiveAdmin.register Month do
  menu label: "Страна месяца"

  index do
    column :id
    column :country
    column "Активна" do |month|
      status_tag("#{month.activate}")
    end
    column :preview
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :country, label: "Страна"
      f.input :month, as: :boolean, label: "Активация"
      f.input :preview, label: "Превью для тура"
      f.input :teaser, label: "Картинка"
    end
    f.buttons
  end

  controller do
    def resource_params
      return [] if request.get?
      [params.require(:month).permit(:preview, :month, :teaser, :country_id)]
    end
  end
end
