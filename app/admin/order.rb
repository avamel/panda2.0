# coding: utf-8
ActiveAdmin.register Order do
  menu :label => "Заказы", :priority => 1
  index do
    column "Заказчик", :title
    column "Телефон", :phone
    column "Имэйл", :email
    column 'Тур' do |order|
      order.tour.title
    end
    column "Создан", :created_at
    default_actions
  end

  # form :html => { :multipart => true } do |f|
  #   f.buttons
  #   f.inputs "Информация о заказе" do
  #     f.input :title, :label => "Название"
  #   end
  #   f.buttons
  # end

  show do |order|
    attributes_table do
      row("Заказчик") { order.title }
      row("Телефон") { order.phone }
      row("Имэйл") { order.email }
      row("Примечание") { order.notation }
      row("Тур") { order.tour.title }
    end
  end
  controller do
    def resource_params
      return [] if request.get?
      [params.require(:order).permit(:title, :phone, :email, :notation)]
    end
  end
end
