require 'spec_helper'

describe 'Ascent::FormBuilder', type: :helper do
  describe '#generate' do
    before do
      (@object = Ascent::Node.new).save
      @builder = Ascent::FormBuilder.new(:node, @object, helper, {})
      allow(@builder).to receive(:field_for).and_return('field')
    end

    it 'does generate all fields for a model' do
      expect(@builder.generate).to eq('<form>')
    end
  end
end
