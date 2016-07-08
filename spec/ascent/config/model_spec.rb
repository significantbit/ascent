require 'spec_helper'

describe Ascent::Config::Model do
  before(:each) do
    @model = Ascent::Config::Model.new(Ascent::Node)
  end

  after(:each) do
    Ascent::Config.reset
  end

  describe '#exclude' do
    it 'can add all fields to exclude array' do
      # Reset to empty array for test
      Ascent::Config.default_excluded_fields = []
      @model.exclude :test, :test2
      expect(@model.excluded.size).to be(2)
    end
    it 'can add both strings and symbols' do
      Ascent::Config.default_excluded_fields = []
      @model.exclude :test, ':test2'
      expect(@model.excluded.size).to be(2)
      expect(@model.excluded.first.class).to be(String)
    end
  end

  describe '#collection_scope' do
    it 'can add proc for a key and calls right scope on #collection' do
      root = create :ascent_node, :root
      create :ascent_node, parent: root
      create :ascent_node, parent: root
      create :ascent_node, parent: root

      @model.collection_scope :key, proc { |scope| scope.where(parent: nil) }
      expect(@model.collection(:key).size).to be(1)
    end
  end
end
