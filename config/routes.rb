Rails.application.routes.draw do

  resources :categories
  resources :articles do
    resources :comments, only: [:create, :destroy, :update]
  end
  devise_for :users
  root 'welcome#index' #el root es la direccion por defecto... osea si tenemos una pagina www.mipagina.cl, ese es el root,
  #ahora si le decimos que la pagina principal es www.mipagina.cl/welcome/index, hacemos lo que esta en el codigo
  #
  #get "inicio", to: "welcome#index" #con esto reenomramos la ruta para asi ir a www.mipagina.cl/inicio


=begin

  get "/articles"
  post "/articles"
  delete "/article/:id"
  get "/articles/:id"
  get "/articles/new"
  get "/articles/:id/edit"
  patch "/articles/:id"
  put "/articles/:id"
=end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
