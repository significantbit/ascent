require 'spec_helper'

describe Ascent::Config do
  describe '.app_name' do
    it 'has a default value' do
      expect(Ascent.config.app_name.call).to eq(['Dummy App', 'Ascent'])
    end

    it 'can be changed' do
      Ascent.config do |config|
        config.app_name = 'Test Changed'
      end
      expect(Ascent.config.app_name).to eq('Test Changed')
    end
  end

  describe '.parent_controller' do
    it 'should default to application controller' do
      expect(Ascent.config.parent_controller).to eq('::ApplicationController')
    end

    it 'can be changed' do
      Ascent.config do |config|
        config.parent_controller = 'TestController'
      end
      expect(Ascent.config.parent_controller).to eq('TestController')
    end
  end
end
