Ascent::Engine.routes.draw do
  match '/', action: :dashboard, as: :dashboard, controller: :ascent, via: :get
  scope ':block_name' do
    match '/', via: :post, controller: :ascent, action: :create
  end
end
