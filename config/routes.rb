Rails.application.routes.draw do
  resources :joints
  resources :outfits
  resources :weathers
  resources :items
  resources :users
  resources :occasions
  resources :colors
  resources :categories
  resources :seasons
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
