Refinery::Core::Engine.routes.draw do
  namespace :admin, path: Refinery::Core.backend_route do
    get '/dialogs/links', to: 'links_dialog#index'
  end
end
