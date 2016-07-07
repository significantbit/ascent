module Ascent
  class FormBuilder < ::ActionView::Helpers::FormBuilder
    include ActionView::Helpers::TranslationHelper

    def generate
      visable_inputs.collect do |fieldset|
        fieldset_for fieldset
      end.join.html_safe +
        @template.render(partial: 'ascent/helpers/submit_buttons')
    end

    def fieldset_for(fieldset)
      @template.content_tag :fieldset, class: 'form-group' do
        contents = []
        contents << (@template.content_tag :label do
          sub_con = []
          sub_con << i18n_key(@object, fieldset)
          sub_con.join.html_safe
        end)
        contents << input_field(fieldset)
        contents.join.html_safe
      end
    end

    private

    def input_field(field)
      if @object.class.reflect_on_association(field.remove('_id'))
        return (@template.render(get_partial('association'),
                                 form: self,
                                 object: @object,
                                 field: field,
                                 collection: @object.class.all))
      else
        type = @object.type_for_attribute(field).type
        return (@template.render get_partial(type), form: self, field: field)
      end
    end

    def i18n_key(obj, key)
      obj_fixed = obj.model_name.i18n_key.to_s.gsub('/', '.')
      translate("activerecord.attributes.#{obj_fixed}.#{key}")
    end

    def get_partial(type)
      "ascent/helpers/#{type}"
    end

    def hidden_attributes
      excluded = @object.try(:excluded_fields) || []
      excluded.concat(%w(id created_at updated_at)).uniq.map(&:to_s)
    end

    def visable_inputs
      (@object.attribute_names - hidden_attributes)
    end
  end
end
