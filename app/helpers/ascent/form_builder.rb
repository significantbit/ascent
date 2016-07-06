module Ascent
  class FormBuilder < ::ActionView::Helpers::FormBuilder
    include ActionView::Helpers::TranslationHelper

    def generate(options = {})
      visable_inputs.collect do |fieldset|
        fieldset_for fieldset
      end.join.html_safe +
      @template.render(partial: 'ascent/helpers/submit_buttons')
    end

    def fieldset_for(fieldset)
      @template.content_tag :fieldset do
        contents = []
        contents << (@template.content_tag :label do
          sub_con = []
          sub_con << i18n_key(@object,fieldset)
          sub_con << input_field(fieldset)
          sub_con.join.html_safe
        end)
        contents.join.html_safe
      end
    end

    private

    def input_field(field)
      if @object.class.reflect_on_association(field.remove('_id'))
        return (@template.render get_partial('association'), form: self, object: @object, field: field, collection: @object.class.all)
      else
        return (@template.render get_partial(@object.type_for_attribute(field).type), form: self, field: field)
      end
    end

    def i18n_key(obj, key)
      translate("activerecord.attributes.#{obj.model_name.i18n_key.to_s.gsub('/','.')}.#{key}")
    end


    def get_partial(type)
      "ascent/helpers/#{type}"
    end

    def hidden_attribues
      #TODO
      ['id', 'created_at', 'updated_at']
    end

    def visable_inputs
      (@object.attribute_names - hidden_attribues)
    end
  end
end
