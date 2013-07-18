ActiveAdmin.register Currency do

  controller do
    def resource_params
      return [] if request.get?
      [params.require(:currency).permit(:title)]
    end
  end

end
