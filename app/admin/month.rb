ActiveAdmin.register Month do
  menu label: "Страна месяца"

  form do |f|
    f.inputs do
      f.input :country, label: "Страна"
      f.input :activate, as: :boolean, label: "Активация"
      f.input :preview, label: "Превью для тура"
      f.input :teaser, label: "Картинки к туру"
    end
    f.buttons
  end

  controller do
    def resource_params
      return [] if request.get?
      [params.require(:month).permit(:preview, :activate, :teaser, :country_id)]
    end
  end
end
