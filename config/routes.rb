Rails.application.routes.draw do

  # Devise
  devise_for :users
  # Index, root or home
  root 'home#index' # Es buena práctica ponerlo al final.
  
  resources :posts do # Es lo mismo que escribir cada una de las rutas asociadas a post.
    resources :comments
    member do
      patch :publish # Patch se usa para actualizar, esto crea la ruta publish_post PATCH  /posts/:id/publish(.:format) posts#publish
    end
  end

  resources :subscriptors # only: [:new, :create]

  get 'admin', to: 'admin#index'
  get 'admin/products', to: 'admin#products'
  resources :products, only: [:new, :create]

  # get 'post/index', to: 'posts#index'
  # .....

  # # Home Routes

  # #get 'home/index'
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # # get 'home', to: 'home#index' # Forma 1
  # get '/home/index', to: 'home#index', as:'cualquier'# Forma 2
  # #get '/home/:name', to: 'home#hello' #hello es una nueva vista, :name -- variable de rutas que puede ser cambiada
  # get '/home/about', to: 'home#about'
  # get '/home/contact_us', to: 'home#contact_us'
  # get '/home/prices', to: 'home#prices'
  
  # # Blog Routes

  # get 'blog2/index'
  # get 'blog2/new'
  # get 'blog2/show'
  # get 'blog2/edit'

  # # Admin Routes

  # get 'admin/index'
  # get 'admin/show'

 
end
