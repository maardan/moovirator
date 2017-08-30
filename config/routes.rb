Rails.application.routes.draw do
	resources :reviews
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'movie#index'
  get 'sort/:id' => 'movie#sort', as: 'sort'
end