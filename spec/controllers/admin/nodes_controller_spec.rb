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

  describe 'DELETE #destory' do
    it 'assigns the requested node to @object' do
      root = create :ascent_node, :root
      delete :destroy, params: { id: root.id }
      expect(assigns(:object)).to eq(root)
    end

    it 'redirects to node index url when it can delete' do
      root = create :ascent_node, :root
      node = create :ascent_node, parent: root
      delete :destroy, params: { id: node.id }
      expect(assigns(:object).destroyed?).to be true
      expect(response).to redirect_to('/admin/nodes')
      expect(flash[:success]).to include('Deleted node')
    end

    it 'it shows flash message when it can\'t delete' do
      allow_any_instance_of(Ascent::Node).to receive(:destroy).and_return(false)
      root = create :ascent_node, :root
      delete :destroy, params: { id: root.id }
      expect(flash[:danger]).to include('Error deleting')
    end
  end

  describe 'POST #update' do
    it 'assigns the requested node to @object' do
      root = create :ascent_node, :root
      post :update, params: { id: root.id }
      expect(assigns(:object)).to eq(root)
    end

    it 'redirects to node url when it can update' do
      root = create :ascent_node, :root
      node = create :ascent_node, parent: root
      post :update, params: { id: node.id }
      expect(response).to redirect_to("/admin/nodes/#{node.id}")
    end

    it 'render #edit when it can\'t update' do
      root = create :ascent_node, :root, name: nil
      post :update, params: { id: root.id }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #new' do
    it 'assigns a new node to @object' do
      get :new
      expect(assigns(:object)).to be_a Ascent::Node
    end

    it 'render template :new' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    it 'redirects to node url when it can create' do
      root = create :ascent_node, :root
      post :create, params: { node: attributes_for(:ascent_node, parent_id: root.id) }
      expect(response).to redirect_to("/admin/nodes/#{assigns(:object).id}")
    end

    it 'render #edit when it can\'t create' do
      post :create, params: { node: attributes_for(:ascent_node, :root, name: nil) }
      expect(response).to render_template :new
    end
  end
end
