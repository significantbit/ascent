describe Ascent::AdminController, type: :controller do
  routes { Ascent::Admin::Engine.routes }
  it 'GET #dashboard' do
    get :dashboard
    expect(response).to render_template(:dashboard)
  end
end
