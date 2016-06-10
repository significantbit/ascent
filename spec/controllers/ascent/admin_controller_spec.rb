describe Ascent::AdminController, type: :controller do
  routes { Ascent::Admin::Engine.routes }
  it 'GET #dashboard' do
    get :dashboard
    expect(response).to render_template(:dashboard)
  end

  it 'GET #nodes' do
    get :nodes
    expect(response).to render_template(:nodes)
  end
end

