ActiveAdmin.register Travel do

  controller do
    def resource_params
      return [] if request.get?
      [params.require(:travel).permit(:title, :preview, :overview)]
    end
  end

end
