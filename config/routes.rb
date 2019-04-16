Rails.application.routes.draw do


  resources :items do
    get :delete, on: :collection
    get :get_sample, on: :collection
    resources :joints, shallow: true, only: [:create, :destroy]
  end

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :destroy]

  resources :outfits, only: [:new, :create, :index, :destroy] do
    get :start, on: :collection
  end

  get('/', { to: 'outfits#start', as: 'first' })
  

end
