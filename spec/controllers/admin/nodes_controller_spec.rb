describe Ascent::Admin::NodesController, type: :controller do
  routes { Ascent::Admin::Engine.routes }
  it 'GET #index' do
    root = create :ascent_node, :root
    get :index
    expect(assigns(:nodes)).to eq([root])
    expect(response).to render_template(:index)
  end

  it 'GET #show' do
    root = create :ascent_node, :root
    get :show, params: { id: root.id }
    expect(assigns(:object)).to eq(root)
    expect(response).to render_template(:show)
  end

  it 'GET #edit' do
    root = create :ascent_node, :root
    get :edit, params: { id: root.id }
    expect(assigns(:object)).to eq(root)
    expect(response).to render_template(:edit)
  end
end
