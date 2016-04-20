require 'spec_helper'

describe Ascent::Engine, type: :routing do
  routes { Ascent::Engine.routes }

  it 'routes to dashboard' do
    expect(get: '/').to route_to(controller: 'ascent/ascent', action: 'dashboard')
  end

  it 'route all admin block routes' do
    expect(post: '/test_block/')
      .to route_to(controller: 'ascent/ascent',
                   action: 'create',
                   block_name: 'test_block')
  end
end
