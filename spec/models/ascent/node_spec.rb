require 'spec_helper'

describe Ascent::Node do
  describe '#url' do
    it 'does not generate a url for root node' do
      root = create :ascent_node, :root
      expect(root.url).to eq('/')
    end
    it 'generates a level1 url after save' do
      root = create :ascent_node, :root
      level1 = create(:ascent_node, name: 'test', parent_id: root.id)
      expect(level1.url).to eq('/test')
    end

    it 'generates a level 2 deep level' do
      root = create :ascent_node, :root
      level1 = create(:ascent_node, name: 'test', parent_id: root.id)
      level2 = create(:ascent_node, name: 'level2', parent_id: level1.id)
      expect(level1.url).to eq('/test')
      expect(level2.url).to eq('/test/level2')
    end
  end
end
