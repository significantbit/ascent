Rails.application.routes.draw do
  mount Ascent::Engine => '/', as: 'ascent'
  mount Ascent::Admin::Engine => '/admin', as: 'ascent_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
