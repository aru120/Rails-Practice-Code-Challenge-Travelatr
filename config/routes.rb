Rails.application.routes.draw do
  resources :posts, only: [:index, :create, :new, :edit, :show, :destroy]
  resources :destinations 
  resources :bloggers
  post '/posts/:id', to: 'posts#add_like', as: "post_like"
  patch '/posts/:id', to: 'posts#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
