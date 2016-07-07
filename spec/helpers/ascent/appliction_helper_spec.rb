require 'spec_helper'

describe 'Ascent::ApplicationHelper', type: :helper do
  include Ascent::ApplicationHelper
  include Ascent::Admin::Engine.routes.url_helpers

  describe '#breadcrumbs' do
    it 'generates right amount of li tags for nested node' do
      root = create :ascent_node, :root
      level1 = create :ascent_node, parent: root
      level2 = create :ascent_node, parent: level1
      expect(breadcrumbs(level2)).to have_selector('li', count: 3)
    end

    it 'generates link to node if link_path is present' do
      root = create :ascent_node, :root
      level1 = create :ascent_node, parent: root
      level2 = create :ascent_node, parent: level1
      expect(breadcrumbs(level2, 'node_path', Ascent::Admin::Engine)).to have_selector('a', count: 3)
    end
  end
end
