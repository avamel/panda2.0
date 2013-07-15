ActiveAdmin.register Country do

  class HtmlInput < Formtastic::Inputs::TextInput
    def to_html
      puts "this is my modified version of TextInput"
      input_wrapping do
        label_html <<
            "<div style='width: 78%; float: left'>".html_safe <<
            builder.text_area(method, input_html_options.merge(:class => 'ckeditor')) <<
            "</div><br style='clear: both'/>".html_safe
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :overview, :as => :html
    end
    f.buttons
  end

  controller do
    def resource_params
      return [] if request.get?
      [ params.require(:country).permit(:title,:overview) ]
    end
  end

end
