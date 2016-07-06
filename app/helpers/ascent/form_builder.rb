module Ascent
  class FormBuilder < ::ActionView::Helpers::FormBuilder
    def generate(options = {})
      visable_inputs.collect do |fieldset|
        fieldset_for fieldset
      end.join.html_safe +
      @template.render(partial: 'ascent/helpers/submit_buttons')
    end

    def fieldset_for(fieldset)
      if @object.class.reflect_on_association(fieldset.remove('_id'))
        #TODO Associsation render
      else
        puts fieldset
        @template.render get_partial(@object.type_for_attribute(fieldset).type), form: self, field: fieldset
      end
    end

    private

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
