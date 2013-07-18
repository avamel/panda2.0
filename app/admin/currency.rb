ActiveAdmin.register Currency do
  menu :label => "Валюта"
  controller do
    def resource_params
      return [] if request.get?
      [params.require(:currency).permit(:title)]
    end
  end

end
