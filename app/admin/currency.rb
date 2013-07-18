ActiveAdmin.register Currency do
  menu label: "Валюта"

  index do
    column :id
    column "Валюта", :title
    default_actions
  end

  controller do
    def resource_params
      return [] if request.get?
      [params.require(:currency).permit(:title)]
    end
  end

end
