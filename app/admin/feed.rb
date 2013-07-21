ActiveAdmin.register Feed do
  menu :label => "Рассылки", :priority => 2
  index do
    column "Название", :title
    column 'Контаков' do |feed|
      feed.feed_contacts.count unless feed.feed_contacts.nil?
    end
    default_actions
  end

  form :html => { :multipart => true } do |f|
    f.buttons
    f.inputs "Информация о рассылке" do
      f.input :title, :label => "Название"

      f.has_many :feed_contacts do |j|
        j.input :text, :label => "Контакт"
        j.input :contact_type, :label => "Тип контакта", :as => :select, :collection => ['email']
        j.inputs do
          if j.object.id
            j.input :_destroy, :as => :boolean, :label => "Удалить"
          end
        end 
      end
    end
    f.buttons
  end


  show do
    panel "Рассылка" do
      attributes_table_for feed do
        row :title
      end
    end
    panel "Контакты" do
      table_for feed.feed_contacts do
        column "Тип контакта" do |contact|
          contact.contact_type
        end
        column "Контакт" do |contact|
          contact.text
        end
      end
    end
  end
  controller do
    def resource_params
      return [] if request.get?
      [params.require(:feed).permit(:title, feed_contacts_attributes: [:id, :contact_type, :text, :_destroy], :feed_contacts_ids => [])]
    end

    def scoped_collection
      super.uniq
    end
  end
end
