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
      test_str = 'button class="submit btn btn-success" type="submit"'
      expect(@builder.generate).to include(test_str)
    end

    it 'does not include excluded fields' do
      module Ascent
        class Node
          ascent do
            exclude :slug
          end
        end
      end
      build_form
      expect(@builder.generate).to_not include('slug')
    end
  end
end
