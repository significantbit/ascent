# Admin Routes
Ascent::Admin::Engine.routes.draw do
  get '/', action: :dashboard, as: :dashboard, controller: :admin, via: :get
  get '/nodes', action: :nodes, as: :nodes, controller: :admin, via: :get
  #scope ':block_name' do
  #  match '/', via: :post, controller: :ascent, action: :create
  #end
end

Ascent::Engine.routes.draw do
  Ascent::Node.all.each do |n|
    if n.controller_class.present?
      get "#{n.url}", to: "#{n.controller_class}#index", as: n.controller_class
      if n.controller_class != n.controller_class.singularize
        get "#{n.url}/:id", to: "#{n.controller_class}#show", as: n.controller_class.to_s.singularize
      end
    elsif n.root?
      get "#{n.url}", to: "nodes#show", defaults: { id: n.id }, as: :root
    else
      get "#{n.url}", to: "nodes#show", defaults: { id: n.id }
    end
  end
end
