ActiveAdmin.register TypeOfHoliday do
  menu label: "Тип тура"

  filter :title, as: :string, label: "Тип тура"

  index title: "Тип тура" do
    column "Тип тура", :title
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :title, label: "Тип тура"
    end
    f.buttons
  end
  controller do
    def resource_params
      return [] if request.get?
      [params.require(:travel).permit(:title)]
    end
  end

end
