require 'spec_helper'

describe 'Ascent::FormBuilder', type: :helper do
  describe '#generate' do
    def build_form
      (@object = Ascent::Node.new).save
      @builder = Ascent::FormBuilder.new(:node, @object, helper, {})
      allow(@builder).to receive(:field_for).and_return('field')
    end

    it 'does generate all fields for a model' do
      build_form
      expect(@builder.generate).to include('<button class="submit btn btn-success" type="submit" name="_save">')
    end

    it 'does not include excluded fields' do
      class Ascent::Node
        def excluded_fields
          [:slug]
        end
      end
      build_form
      expect(@builder.generate).to_not include('slug')
    end

    after(:each) do
      class Ascent::Node
        undef_method :excluded_fields if respond_to? :excluded_fields
      end
    end
  end
end
