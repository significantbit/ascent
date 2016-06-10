require 'spec_helper'

describe Ascent::Admin::Engine, type: :routing do
  routes { Ascent::Admin::Engine.routes }

  describe 'routes admin default routes' do
    it 'GET #dashboard' do
      expect(get: '/').to route_to(controller: 'ascent/admin', action: 'dashboard')
    end

    it 'GET #nodes' do
      expect(get: '/nodes').to route_to(controller: 'ascent/admin/nodes', action: 'index')
    end
  end
end
